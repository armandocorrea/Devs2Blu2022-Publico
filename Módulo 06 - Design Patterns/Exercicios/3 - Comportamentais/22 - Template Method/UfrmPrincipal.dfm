object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Template Method'
  ClientHeight = 387
  ClientWidth = 591
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object GroupBox1: TGroupBox
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 585
    Height = 70
    Align = alTop
    TabOrder = 0
    object Label1: TLabel
      Left = 11
      Top = 8
      Width = 46
      Height = 13
      Caption = 'Consulta:'
    end
    object edtNome: TEdit
      Left = 11
      Top = 24
      Width = 246
      Height = 21
      TabOrder = 0
    end
    object RadioGroup1: TRadioGroup
      Left = 268
      Top = 8
      Width = 185
      Height = 47
      Caption = 'Tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Reposit'#243'rios'
        'Usu'#225'rios')
      TabOrder = 1
    end
    object Button1: TButton
      Left = 459
      Top = 18
      Width = 110
      Height = 33
      Caption = 'Consultar'
      TabOrder = 2
      OnClick = Button1Click
    end
  end
  object DBGrid1: TDBGrid
    Left = 0
    Top = 76
    Width = 591
    Height = 311
    Align = alClient
    DataSource = DataSource1
    TabOrder = 1
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 288
    Top = 200
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 368
    Top = 200
  end
end
