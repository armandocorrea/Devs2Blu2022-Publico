object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consumindo DLL do Delphi'
  ClientHeight = 199
  ClientWidth = 295
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
    Left = 16
    Top = 16
    Width = 75
    Height = 13
    Caption = 'Digite um Texto'
  end
  object Label2: TLabel
    Left = 16
    Top = 104
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
  end
  object Label3: TLabel
    Left = 152
    Top = 104
    Width = 28
    Height = 13
    Caption = 'Texto'
  end
  object edtTexto: TEdit
    Left = 16
    Top = 35
    Width = 249
    Height = 21
    TabOrder = 0
  end
  object btnMaiusculas: TButton
    Left = 16
    Top = 63
    Width = 113
    Height = 25
    Caption = 'Mai'#250'sculas'
    TabOrder = 1
    OnClick = btnMaiusculasClick
  end
  object btnMinusculas: TButton
    Left = 152
    Top = 63
    Width = 113
    Height = 25
    Caption = 'Min'#250'sculas'
    TabOrder = 2
    OnClick = btnMinusculasClick
  end
  object edtNumero: TSpinEdit
    Left = 16
    Top = 123
    Width = 113
    Height = 22
    MaxValue = 0
    MinValue = 0
    TabOrder = 3
    Value = 0
  end
  object edtTextoConvertido: TEdit
    Left = 152
    Top = 123
    Width = 113
    Height = 21
    TabOrder = 4
  end
  object btnConverter: TButton
    Left = 96
    Top = 160
    Width = 75
    Height = 25
    Caption = 'Converter'
    TabOrder = 5
    OnClick = btnConverterClick
  end
end
