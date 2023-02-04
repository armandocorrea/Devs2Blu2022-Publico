object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consumindo Meu Primeiro WS REST'
  ClientHeight = 156
  ClientWidth = 250
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object lblResultado: TLabel
    Left = 165
    Top = 39
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
  object btnPingPong: TButton
    Left = 69
    Top = 8
    Width = 75
    Height = 25
    Caption = 'PingPong'
    TabOrder = 0
    OnClick = btnPingPongClick
  end
  object btnHelloWorld: TButton
    Left = 150
    Top = 8
    Width = 75
    Height = 25
    Caption = 'Hello World'
    TabOrder = 1
    OnClick = btnHelloWorldClick
  end
  object RESTClient1: TRESTClient
    BaseURL = 'http://localhost:9090/ping'
    Params = <>
    Left = 24
    Top = 88
  end
  object RESTRequest1: TRESTRequest
    AssignedValues = [rvConnectTimeout, rvReadTimeout]
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    ConnectTimeout = 0
    ReadTimeout = 0
    Left = 104
    Top = 88
  end
  object RESTResponse1: TRESTResponse
    Left = 184
    Top = 88
  end
end
