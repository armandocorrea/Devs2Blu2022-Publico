object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consumindo Meu Primeiro WS SOAP'
  ClientHeight = 87
  ClientWidth = 336
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
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object lblResultado: TLabel
    Left = 146
    Top = 61
    Width = 60
    Height = 13
    Caption = 'Resultado:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtValor: TEdit
    Left = 16
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object btnEchoDouble: TButton
    Left = 146
    Top = 30
    Width = 75
    Height = 25
    Caption = 'echoDouble'
    TabOrder = 1
    OnClick = btnEchoDoubleClick
  end
  object btnHelloWorld: TButton
    Left = 227
    Top = 30
    Width = 75
    Height = 25
    Caption = 'Hello World'
    TabOrder = 2
    OnClick = btnHelloWorldClick
  end
end
