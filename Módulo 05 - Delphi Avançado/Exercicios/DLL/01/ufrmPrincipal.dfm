object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Informa'#231#245'es do Sistema Operacional'
  ClientHeight = 385
  ClientWidth = 496
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
    Top = 24
    Width = 104
    Height = 13
    Caption = 'Nome do Computador'
  end
  object Label2: TLabel
    Left = 16
    Top = 80
    Width = 81
    Height = 13
    Caption = 'Nome do Usu'#225'rio'
  end
  object Label3: TLabel
    Left = 16
    Top = 136
    Width = 96
    Height = 13
    Caption = 'Diret'#243'rio do Sistema'
  end
  object Label4: TLabel
    Left = 16
    Top = 192
    Width = 102
    Height = 13
    Caption = 'Diret'#243'rio do Windows'
  end
  object Label5: TLabel
    Left = 16
    Top = 248
    Width = 84
    Height = 13
    Caption = 'Pasta Tempor'#225'ria'
  end
  object Label6: TLabel
    Left = 16
    Top = 304
    Width = 94
    Height = 13
    Caption = 'Vers'#227'o do Windows'
  end
  object edtNomePC: TEdit
    Left = 16
    Top = 43
    Width = 465
    Height = 21
    ReadOnly = True
    TabOrder = 0
  end
  object edtNomeUser: TEdit
    Left = 16
    Top = 99
    Width = 465
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object edtDirSistema: TEdit
    Left = 16
    Top = 155
    Width = 465
    Height = 21
    ReadOnly = True
    TabOrder = 2
  end
  object edtDirWindows: TEdit
    Left = 16
    Top = 211
    Width = 465
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object edtDirTemp: TEdit
    Left = 16
    Top = 267
    Width = 465
    Height = 21
    ReadOnly = True
    TabOrder = 4
  end
  object edtVersaoWindows: TEdit
    Left = 16
    Top = 323
    Width = 465
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object btnInformacoes: TButton
    Left = 192
    Top = 354
    Width = 75
    Height = 25
    Caption = 'Informa'#231#245'es'
    TabOrder = 6
    OnClick = btnInformacoesClick
  end
end
