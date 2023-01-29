object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Chain Of Responsibility'
  ClientHeight = 238
  ClientWidth = 322
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 16
    Width = 41
    Height = 13
    Caption = 'Arquivo:'
  end
  object Edit1: TEdit
    Left = 24
    Top = 35
    Width = 273
    Height = 21
    TabOrder = 0
    Text = '< Clique no bot'#227'o abaixo para selecionar o arquivo >'
  end
  object btnProcessar: TButton
    Left = 72
    Top = 62
    Width = 177
    Height = 25
    Caption = 'Processar Inclus'#227'o'
    TabOrder = 1
    OnClick = btnProcessarClick
  end
  object DBGrid1: TDBGrid
    Left = 24
    Top = 93
    Width = 273
    Height = 120
    DataSource = DataSource1
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Codigo'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Cidade'
        Width = 80
        Visible = True
      end>
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      5D0000009619E0BD0100000018000000030000000000030000005D0006436F64
      69676F0400010000000000044E6F6D6501004900000001000557494454480200
      0200320006436964616465010049000000010005574944544802000200280000
      00}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 48
    Top = 144
    object ClientDataSet1Codigo: TIntegerField
      FieldName = 'Codigo'
    end
    object ClientDataSet1Nome: TStringField
      FieldName = 'Nome'
      Size = 50
    end
    object ClientDataSet1Cidade: TStringField
      FieldName = 'Cidade'
      Size = 40
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 128
    Top = 152
  end
  object OpenDialog1: TOpenDialog
    Left = 200
    Top = 144
  end
end
