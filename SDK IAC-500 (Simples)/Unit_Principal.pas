unit Unit_Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, IdBaseComponent, IdComponent, IdUDPBase, IdUDPServer,
  IdUDPClient, IdSocketHandle;

type
  TPrincipal = class(TForm)
    IP_Computador: TEdit;
    IP_Controladora: TEdit;
    Comando: TEdit;
    Dados: TEdit;
    Lista_Comandos: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Enviar_Comando: TButton;
    Socket_Comunicacao: TIdUDPServer;
    function HexToInt(const HexStr: string): Integer;
    procedure Enviar_Comando_Click(Sender: TObject);
    procedure Monta_Pacote_UDP(ip_dest, addr, cmd, dados : String);
    procedure Recebimento_Comando(Sender: TObject; AData: TStream;
      ABinding: TIdSocketHandle);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Principal: TPrincipal;

implementation

{$R *.dfm}

function TPrincipal.HexToInt(const HexStr: string): Integer;
var
  x: integer;
  cTmp: Char;
begin
  Result := 0;
  for x := 1 to Length(HexStr) do
    begin
    cTmp := HexStr[x];
    case cTmp of
      '0'..'9': Result := 16 * Result + (Ord(cTmp) - $30);
      'A'..'F': Result := 16 * Result + (Ord(cTmp) - $37);
      'a'..'f': Result := 16 * Result + (Ord(cTmp) - $57);
    else
      raise EConvertError.Create('Illegal character in hex string');
    end;
  end;
end;


procedure TPrincipal.Enviar_Comando_Click(Sender: TObject);
var
  porta_recebimento : integer;
begin
  porta_recebimento := 2552;                                                // Define a porta para recepção de comando da placa controladora
  Socket_Comunicacao.Active := False;                                       // desativa socket de comunicacao
  try                                                                       // Cria estrutura para tentativa de habilitar o socket
    Socket_Comunicacao.Bindings.Clear;                                      // limpa informações definidas
    Socket_Comunicacao.Bindings.Add.IP := IP_Computador.Text;               // Configura o socket com o ip do computador
    Socket_Comunicacao.Bindings.Add.Port := porta_recebimento;              // Define no socket a porta para recepção dos comandos da controladora
    Application.ProcessMessages();                                          // Processa mensagens pendentes do aplicativo
    Socket_Comunicacao.Active := True;                                      // Habilita / ativa o socket para envio e recepção de comandos
  except                                                                    // Se ocorrer alguma exceção
    Socket_Comunicacao.Active := False;                                     // Se falhar a ativação do socket desativa o socket
    ShowMessage('Erro na conexão do socket');                               // Gera alerta da falha de conexão do socket
  end;                                                                      // Fim do bloco TRY
  Monta_Pacote_UDP(IP_Controladora.Text, '01', Comando.text, Dados.Text);   // Envia o comando conforme dados preenchidos nos Edit´s
end;

procedure TPrincipal.Monta_Pacote_UDP(ip_dest, addr, cmd, dados : String);
var
  CheckSum : byte;
  i, qtd_bytes_dados, tam_pacote_total, porta_destino : integer;
  dado : array [1..1500] of byte;
  str_TX, dado_str, UDP_Packet, Cmd_Code, Frame_Data, Frame_CheckSum, UDP_Size1, UDP_Size2, Frame_Size, Frame_Start, Frame_Stop, UDP_Obj_Pointer, UDP_End : string;
begin
  porta_destino := 26482;
  cmd_code := chr(HexToInt(cmd));
  dado_str := dados;
  qtd_bytes_dados := length(dado_str) div 2;
  Frame_Data := '';
  for i := 1 to qtd_bytes_dados do
    begin
      dado[i] := HexToInt(dado_str[(i*2)-1] + dado_str[(i*2)]);
      Frame_Data := Frame_Data + chr(dado[i]);
    end;
  CheckSum := 0;
  CheckSum := CheckSum xor (qtd_bytes_dados + 5) xor ($01) xor (HexToInt(cmd));
  for i := 1 to qtd_bytes_dados do
    CheckSum := CheckSum xor dado[i];
  CheckSum := not CheckSum;
  Frame_CheckSum := chr(CheckSum);
  UDP_Size1 := chr(qtd_bytes_dados+8);
  UDP_Size2 := chr((qtd_bytes_dados+8) xor $FF);
  Frame_Size := chr(qtd_bytes_dados+5);
  Frame_Start := chr($5A)+chr($A5);
  Frame_Stop := chr($5F)+chr($F5);
  UDP_Obj_Pointer := chr($19) + chr($FF);
  UDP_End := chr($00) + chr($00);
  UDP_Packet := Frame_Start + Frame_Size + chr(HexToInt(addr)) + cmd_code + Frame_Data + Frame_CheckSum + Frame_Stop;
  for i:= 1 to length(UDP_Packet) do
    UDP_Packet[i] := char(ord(UDP_Packet[i]));
  UDP_Packet := UDP_Size1 + UDP_Size2 + UDP_Obj_Pointer + UDP_Packet + UDP_End;
  // Converte para texto para ser apresentado no Memo
  str_TX := '';
  tam_pacote_total := qtd_bytes_dados+13;
  for i := 1 to tam_pacote_total do str_TX := str_TX + IntToHex(ord(UDP_Packet[i]), 2) + '.';
    Lista_Comandos.Lines.Add('TX: ' + str_TX);
  Socket_Comunicacao.Send(ip_dest, porta_destino, UDP_Packet);
end;


procedure TPrincipal.Recebimento_Comando(Sender: TObject; AData: TStream; ABinding: TIdSocketHandle);
var
  i : Integer;
  str_RX : String;
  DataStringStream: TStringStream;
  my_data: String;
begin
  if ABinding.PeerIP = IP_Controladora.Text then
  Begin
    DataStringStream:=TStringStream.Create('');
    try
      DataStringStream.CopyFrom(AData,AData.Size);
      my_data := copy(DataStringStream.DataString, 1, AData.Size);
    except
      ShowMessage('Erro ao receber! ');
    end;
    str_RX := '';
    //Apresenta Dados recebidos no memo
    for i:= 1 to AData.Size do
      str_RX := str_RX + IntToHex(Ord(my_data[i]), 2) + '.';
    Lista_Comandos.Lines.Add('RX: ' + str_RX);
    Lista_Comandos.Lines.Add('');
  end;
end;

end.
