object frmCalculadora: TfrmCalculadora
  Left = 0
  Top = 0
  Caption = 'Calculadora'
  ClientHeight = 136
  ClientWidth = 342
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
    Left = 245
    Top = 55
    Width = 14
    Height = 23
    Caption = '='
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 18
    Top = 7
    Width = 313
    Height = 23
    Caption = 'CALCULADORA +DEVS2BLU - DELPHI'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object edtNumerador: TEdit
    Left = 24
    Top = 54
    Width = 57
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object edtDenominador: TEdit
    Left = 182
    Top = 54
    Width = 57
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 1
  end
  object edtResultado: TEdit
    Left = 265
    Top = 54
    Width = 57
    Height = 24
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ReadOnly = True
    TabOrder = 2
  end
  object cmbOperador: TComboBox
    Left = 87
    Top = 56
    Width = 89
    Height = 21
    Style = csDropDownList
    TabOrder = 3
    Items.Strings = (
      'Somar'
      'Subtrair'
      'Multiplicar'
      'Dividir'
      'Resto'
      'Divis'#227'o Inteira')
  end
  object Button1: TButton
    Left = 136
    Top = 92
    Width = 75
    Height = 25
    Caption = 'CALCULAR'
    TabOrder = 4
    OnClick = Button1Click
  end
end
