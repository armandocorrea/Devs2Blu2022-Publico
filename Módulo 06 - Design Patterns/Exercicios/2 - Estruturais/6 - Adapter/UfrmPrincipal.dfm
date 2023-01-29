object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Adapter'
  ClientHeight = 158
  ClientWidth = 263
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
    Top = 8
    Width = 23
    Height = 13
    Caption = 'CEP:'
  end
  object lblLogradouro: TLabel
    Left = 16
    Top = 64
    Width = 78
    Height = 13
    Caption = 'lblLogradouro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblBairro: TLabel
    Left = 16
    Top = 80
    Width = 47
    Height = 13
    Caption = 'lblBairro'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblCidade: TLabel
    Left = 16
    Top = 99
    Width = 51
    Height = 13
    Caption = 'lblCidade'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnConsultar: TButton
    Left = 152
    Top = 24
    Width = 97
    Height = 25
    Caption = 'Consultar ViaCEP'
    TabOrder = 0
    OnClick = btnConsultarClick
  end
  object edtCEP: TEdit
    Left = 16
    Top = 26
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object Button1: TButton
    Left = 152
    Top = 55
    Width = 97
    Height = 25
    Caption = 'Consultar Correios'
    TabOrder = 2
    OnClick = Button1Click
  end
end
