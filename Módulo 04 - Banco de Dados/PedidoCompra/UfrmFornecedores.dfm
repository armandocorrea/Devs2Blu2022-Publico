object frmFornecedores: TfrmFornecedores
  Left = 0
  Top = 0
  Caption = 'Fornecedores'
  ClientHeight = 257
  ClientWidth = 607
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
    Left = 14
    Top = 47
    Width = 10
    Height = 13
    Caption = 'Id'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 14
    Top = 87
    Width = 25
    Height = 13
    Caption = 'CNPJ'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 14
    Top = 127
    Width = 27
    Height = 13
    Caption = 'Nome'
    FocusControl = DBEdit3
  end
  object DBGrid1: TDBGrid
    Left = 14
    Top = 171
    Width = 579
    Height = 76
    DataSource = DataSource
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Id'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'CNPJ'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Nome'
        Width = 250
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 14
    Top = 8
    Width = 240
    Height = 25
    DataSource = DataSource
    TabOrder = 1
  end
  object DBEdit1: TDBEdit
    Left = 14
    Top = 63
    Width = 134
    Height = 21
    DataField = 'Id'
    DataSource = DataSource
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 14
    Top = 103
    Width = 186
    Height = 21
    DataField = 'CNPJ'
    DataSource = DataSource
    TabOrder = 3
  end
  object DBEdit3: TDBEdit
    Left = 14
    Top = 143
    Width = 250
    Height = 21
    DataField = 'Nome'
    DataSource = DataSource
    TabOrder = 4
  end
  object DataSource: TDataSource
    DataSet = FDTable
    Left = 312
    Top = 40
  end
  object FDTable: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'fornecedor'
    Left = 376
    Top = 40
    object FDTableId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTableCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object FDTableNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 250
    end
  end
end
