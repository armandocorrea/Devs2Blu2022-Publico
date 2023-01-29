object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Que Animal sou eu?'
  ClientHeight = 202
  ClientWidth = 236
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
    Left = 40
    Top = 16
    Width = 159
    Height = 19
    Caption = 'Que animal sou eu?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object cmbAnimal: TComboBox
    Left = 40
    Top = 41
    Width = 159
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    Items.Strings = (
      'Cachorro'
      'P'#225'ssaro'
      'Gato'
      'Peixe')
  end
  object Button1: TButton
    Left = 40
    Top = 68
    Width = 159
    Height = 25
    Caption = 'Processar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object mmHistorico: TMemo
    Left = 40
    Top = 99
    Width = 159
    Height = 89
    TabOrder = 2
  end
end
