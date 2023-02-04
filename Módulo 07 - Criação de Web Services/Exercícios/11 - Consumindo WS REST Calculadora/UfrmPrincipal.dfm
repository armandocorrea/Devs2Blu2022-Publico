object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consumindo Calculadora SOAP'
  ClientHeight = 336
  ClientWidth = 439
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
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Valor 1:'
  end
  object Label2: TLabel
    Left = 143
    Top = 13
    Width = 37
    Height = 13
    Caption = 'Valor 2:'
  end
  object Label3: TLabel
    Left = 16
    Top = 59
    Width = 51
    Height = 13
    Caption = 'Opera'#231#227'o:'
  end
  object lblResultado: TLabel
    Left = 204
    Top = 106
    Width = 60
    Height = 13
    Alignment = taRightJustify
    Caption = 'Resultado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValor1: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtValor2: TEdit
    Left = 143
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object cmbOperacao: TComboBox
    Left = 16
    Top = 77
    Width = 121
    Height = 21
    Style = csDropDownList
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
    Left = 143
    Top = 75
    Width = 121
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = btnCalcularClick
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:9090/somar/10/15'
    Params = <>
    Left = 48
    Top = 144
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    ConnectTimeout = 0
    ReadTimeout = 0
    Left = 120
    Top = 144
  end
  object RESTResponse1: TRESTResponse
    Left = 176
    Top = 144
  end
end
