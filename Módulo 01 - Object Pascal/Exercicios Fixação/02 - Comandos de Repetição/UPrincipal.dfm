object Form1: TForm1
  Left = 451
  Top = 242
  Width = 334
  Height = 263
  Caption = 'Comandos de Repetição - For, While e Repeat'
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
    Left = 16
    Top = 16
    Width = 274
    Height = 30
    Caption = 'COMANDOS DE REPETIÇÃO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object rgComandos: TRadioGroup
    Left = 56
    Top = 56
    Width = 185
    Height = 105
    Caption = 'Comandos'
    Items.Strings = (
      'For'
      'While'
      'Repeat')
    TabOrder = 0
  end
  object btnExecutar: TButton
    Left = 166
    Top = 181
    Width = 75
    Height = 25
    Caption = 'Executar'
    TabOrder = 1
    OnClick = btnExecutarClick
  end
  object edtInput2: TEdit
    Left = 56
    Top = 194
    Width = 103
    Height = 21
    TabOrder = 2
  end
  object edtInput1: TEdit
    Left = 56
    Top = 170
    Width = 103
    Height = 21
    TabOrder = 3
  end
end
