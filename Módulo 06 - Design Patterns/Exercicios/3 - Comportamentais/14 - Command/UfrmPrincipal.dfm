object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Command'
  ClientHeight = 302
  ClientWidth = 587
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 45
    Width = 55
    Height = 13
    Caption = 'Programas:'
  end
  object Label2: TLabel
    Left = 199
    Top = 47
    Width = 48
    Height = 13
    Caption = 'Processos'
  end
  object Label3: TLabel
    Left = 390
    Top = 45
    Width = 110
    Height = 13
    Caption = 'Vari'#225'veis de Ambiente:'
  end
  object btnExecutar: TButton
    Left = 240
    Top = 8
    Width = 113
    Height = 33
    Caption = 'Executar Comandos'
    TabOrder = 0
    OnClick = btnExecutarClick
  end
  object memoProgramas: TMemo
    Left = 8
    Top = 64
    Width = 185
    Height = 225
    ScrollBars = ssBoth
    TabOrder = 1
  end
  object memoProcessos: TMemo
    Left = 199
    Top = 64
    Width = 185
    Height = 225
    ScrollBars = ssBoth
    TabOrder = 2
  end
  object memoVariaveis: TMemo
    Left = 390
    Top = 64
    Width = 185
    Height = 225
    ScrollBars = ssBoth
    TabOrder = 3
  end
end
