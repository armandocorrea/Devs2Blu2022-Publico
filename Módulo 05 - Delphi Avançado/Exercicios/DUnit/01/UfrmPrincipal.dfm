object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Calculadora Devs2Blu'
  ClientHeight = 199
  ClientWidth = 153
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
    Top = 10
    Width = 50
    Height = 13
    Caption = 'N'#250'mero 1:'
  end
  object Label2: TLabel
    Left = 16
    Top = 58
    Width = 50
    Height = 13
    Caption = 'N'#250'mero 2:'
  end
  object lblResultado: TLabel
    Left = 16
    Top = 179
    Width = 66
    Height = 13
    Alignment = taCenter
    Caption = 'RESULTADO'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 16
    Top = 102
    Width = 51
    Height = 13
    Caption = 'Opera'#231#227'o:'
  end
  object edtNumero1: TEdit
    Left = 16
    Top = 28
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNumero2: TEdit
    Left = 16
    Top = 76
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object cmbOperacoes: TComboBox
    Left = 16
    Top = 121
    Width = 121
    Height = 21
    ItemIndex = 0
    TabOrder = 2
    Text = 'Somar'
    Items.Strings = (
      'Somar'
      'Subtrair'
      'Multiplicar'
      'Dividir')
  end
  object btnCalcular: TButton
    Left = 16
    Top = 148
    Width = 121
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = btnCalcularClick
  end
end
