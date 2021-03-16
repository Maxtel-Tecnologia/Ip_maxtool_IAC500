object Principal: TPrincipal
  Left = 701
  Top = 293
  Width = 432
  Height = 443
  Caption = 'Principal'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 11
    Top = 10
    Width = 92
    Height = 13
    Caption = 'IP Computador: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 6
    Top = 42
    Width = 97
    Height = 13
    Caption = 'IP Controladora: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 42
    Top = 75
    Width = 61
    Height = 13
    Caption = 'Comando: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 58
    Top = 107
    Width = 45
    Height = 13
    Caption = 'Dados: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 17
    Top = 176
    Width = 245
    Height = 13
    Caption = 'Lista dos Comandos Enviados e Recebidos'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object IP_Computador: TEdit
    Left = 105
    Top = 6
    Width = 121
    Height = 21
    TabOrder = 0
    Text = '192.168.0.1'
  end
  object IP_Controladora: TEdit
    Left = 105
    Top = 38
    Width = 121
    Height = 21
    TabOrder = 1
    Text = '192.168.0.200'
  end
  object Comando: TEdit
    Left = 105
    Top = 71
    Width = 59
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 2
    Text = '06'
  end
  object Dados: TEdit
    Left = 105
    Top = 103
    Width = 121
    Height = 21
    CharCase = ecUpperCase
    TabOrder = 3
    Text = '0A0A03'
  end
  object Enviar_Comando: TButton
    Left = 156
    Top = 137
    Width = 105
    Height = 25
    Caption = 'Enviar Comando'
    TabOrder = 4
    OnClick = Enviar_Comando_Click
  end
  object Lista_Comandos: TMemo
    Left = 17
    Top = 196
    Width = 381
    Height = 189
    TabStop = False
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object Socket_Comunicacao: TIdUDPServer
    BroadcastEnabled = True
    Bindings = <>
    DefaultPort = 0
    OnUDPRead = Recebimento_Comando
    Left = 356
    Top = 8
  end
end
