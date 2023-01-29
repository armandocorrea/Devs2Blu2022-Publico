object Form1: TForm1
  Left = 383
  Top = 237
  Width = 218
  Height = 140
  Caption = 'OOP'
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
    Left = 24
    Top = 24
    Width = 35
    Height = 13
    Caption = 'Animal'
  end
  object cmbAnimal: TComboBox
    Left = 24
    Top = 40
    Width = 145
    Height = 21
    ItemHeight = 13
    TabOrder = 0
    Items.Strings = (
      'Cachorro'
      'Gato'
      'Pássaro')
  end
  object btnSom: TButton
    Left = 24
    Top = 64
    Width = 145
    Height = 25
    Caption = 'Que som eu faço?'
    TabOrder = 1
    OnClick = btnSomClick
  end
end
