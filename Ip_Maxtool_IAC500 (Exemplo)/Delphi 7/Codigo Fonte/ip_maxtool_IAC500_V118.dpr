program ip_maxtool_IAC500_V118;

{$R 'uac.res' 'uac.rc'}

uses
  Forms,
  Unit1 in 'Unit1.pas' {Form1},
  U_Ip_Servidor in 'U_Ip_Servidor.pas' {Ip_Servidor},
  Ulogcom in 'Ulogcom.pas' {LogCom},
  U_aviso in 'U_aviso.pas' {Aviso};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'IP Maxtool -  Maxtel Tecnologia Ltda.';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TLogCom, LogCom);
  Application.CreateForm(TAviso, Aviso);
  Application.Run;
end.
