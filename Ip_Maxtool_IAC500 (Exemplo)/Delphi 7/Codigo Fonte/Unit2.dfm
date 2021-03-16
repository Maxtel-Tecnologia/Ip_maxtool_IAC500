object Ip_Servidor: TIp_Servidor
  Left = 599
  Top = 292
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Escolher IP Computador'
  ClientHeight = 111
  ClientWidth = 241
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 63
    Top = 15
    Width = 114
    Height = 13
    Caption = 'Escolher IP Computador'
  end
  object ComboBox1: TComboBox
    Left = 48
    Top = 38
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
  end
  object Button1: TButton
    Left = 82
    Top = 70
    Width = 75
    Height = 25
    Caption = 'Selecionar'
    TabOrder = 1
  end
end
