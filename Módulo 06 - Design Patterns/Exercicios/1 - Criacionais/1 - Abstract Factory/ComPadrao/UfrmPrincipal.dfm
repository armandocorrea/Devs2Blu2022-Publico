object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sem Abstract Factory'
  ClientHeight = 360
  ClientWidth = 287
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object cmbMarca: TComboBox
    Left = 24
    Top = 32
    Width = 137
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'Dell'
    Items.Strings = (
      'Dell'
      'Apple')
  end
  object btnExibir: TButton
    Left = 86
    Top = 59
    Width = 75
    Height = 25
    Caption = 'Exibir'
    TabOrder = 1
    OnClick = btnExibirClick
  end
  object GroupBox1: TGroupBox
    Left = 24
    Top = 120
    Width = 185
    Height = 89
    Caption = 'Dados do Notebook'
    TabOrder = 2
    object lblTamanhoTela: TLabel
      Left = 10
      Top = 22
      Width = 90
      Height = 13
      Caption = 'lblTamanhoTela'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblMemoriaRam: TLabel
      Left = 10
      Top = 47
      Width = 89
      Height = 13
      Caption = 'lblMemoriaRam'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 24
    Top = 232
    Width = 185
    Height = 89
    Caption = 'Dados do Desktop'
    TabOrder = 3
    object lblProcessador: TLabel
      Left = 16
      Top = 22
      Width = 83
      Height = 13
      Caption = 'lblProcessador'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTamanhoHD: TLabel
      Left = 16
      Top = 47
      Width = 82
      Height = 13
      Caption = 'lblTamanhoHD'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
end
