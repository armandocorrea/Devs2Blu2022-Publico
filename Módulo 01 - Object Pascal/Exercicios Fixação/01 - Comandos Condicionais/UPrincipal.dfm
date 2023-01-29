object Form1: TForm1
  Left = 304
  Top = 125
  Width = 441
  Height = 205
  Caption = 'Comandos Condicionais - IF e Case'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 9
    Width = 341
    Height = 30
    Caption = 'Comandos Condicionais - IF e Case'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnIf: TButton
    Left = 32
    Top = 85
    Width = 75
    Height = 25
    Caption = 'If'
    TabOrder = 0
    OnClick = btnIfClick
  end
  object btnCase: TButton
    Left = 124
    Top = 85
    Width = 75
    Height = 25
    Caption = 'Case'
    TabOrder = 1
    OnClick = btnCaseClick
  end
  object edtInput: TEdit
    Left = 32
    Top = 53
    Width = 167
    Height = 21
    TabOrder = 2
  end
  object rgNivel: TRadioGroup
    Left = 211
    Top = 47
    Width = 185
    Height = 105
    Caption = 'Nível'
    ItemIndex = 0
    Items.Strings = (
      'Estagiário'
      'Junior'
      'Pleno'
      'Sênior')
    TabOrder = 3
  end
end
