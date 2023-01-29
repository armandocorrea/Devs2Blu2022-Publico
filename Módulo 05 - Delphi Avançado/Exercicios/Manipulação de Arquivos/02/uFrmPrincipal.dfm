object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Lendo Arquivo Texto'
  ClientHeight = 462
  ClientWidth = 461
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
    Width = 135
    Height = 13
    Caption = 'Informe o nome do Arquivo:'
  end
  object edtArquivo: TEdit
    Left = 16
    Top = 32
    Width = 433
    Height = 21
    TabOrder = 0
  end
  object btnLeitura: TButton
    Left = 16
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Ler Arquivo'
    TabOrder = 1
    OnClick = btnLeituraClick
  end
  object mmArquivo: TMemo
    Left = 16
    Top = 90
    Width = 433
    Height = 359
    TabOrder = 2
  end
end
