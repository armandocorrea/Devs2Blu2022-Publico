object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Calculadora Utilizando Interfaces'
  ClientHeight = 234
  ClientWidth = 314
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
    Width = 50
    Height = 13
    Caption = 'N'#250'mero 1:'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 50
    Height = 13
    Caption = 'N'#250'mero 2:'
  end
  object Label3: TLabel
    Left = 16
    Top = 110
    Width = 47
    Height = 13
    Caption = 'Opera'#231#227'o'
  end
  object lblResultado: TLabel
    Left = 16
    Top = 195
    Width = 82
    Height = 19
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtNumero1: TEdit
    Left = 16
    Top = 35
    Width = 113
    Height = 21
    TabOrder = 0
  end
  object edtNumero2: TEdit
    Left = 16
    Top = 83
    Width = 113
    Height = 21
    TabOrder = 1
  end
  object cmbOperacao: TComboBox
    Left = 16
    Top = 130
    Width = 113
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'Somar'
      'Subtrair'
      'Multiplicar'
      'Dividir')
  end
  object btnCalcular: TButton
    Left = 16
    Top = 164
    Width = 113
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = btnCalcularClick
  end
end
