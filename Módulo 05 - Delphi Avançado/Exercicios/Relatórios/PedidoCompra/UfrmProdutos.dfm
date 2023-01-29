object frmProdutos: TfrmProdutos
  Left = 0
  Top = 0
  Caption = 'Produtos'
  ClientHeight = 299
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
    Top = 39
    Width = 10
    Height = 13
    Caption = 'Id'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 14
    Top = 79
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 14
    Top = 122
    Width = 91
    Height = 13
    Caption = 'Unidade de Medida'
  end
  object DBEdit1: TDBEdit
    Left = 14
    Top = 55
    Width = 134
    Height = 21
    DataField = 'Id'
    DataSource = DataSource
    ReadOnly = True
    TabOrder = 0
  end
  object DBEdit2: TDBEdit
    Left = 14
    Top = 96
    Width = 200
    Height = 21
    DataField = 'Descricao'
    DataSource = DataSource
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 14
    Top = 167
    Width = 579
    Height = 120
    DataSource = DataSource
    TabOrder = 3
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
        FieldName = 'Descricao'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idUnidadeMedida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LoockupUnidadeMedida'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LookupUnidadeMedida'
        Width = 50
        Visible = True
      end>
  end
  object DBNavigator1: TDBNavigator
    Left = 14
    Top = 8
    Width = 240
    Height = 25
    DataSource = DataSource
    TabOrder = 4
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 14
    Top = 138
    Width = 145
    Height = 21
    DataField = 'idUnidadeMedida'
    DataSource = DataSource
    KeyField = 'Id'
    ListField = 'Descricao'
    ListSource = DataSource1
    TabOrder = 2
  end
  object DataSource: TDataSource
    DataSet = FDTable
    Left = 96
    Top = 224
  end
  object FDTable: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'devs2blu.produto'
    Left = 160
    Top = 224
    object FDTableId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTableDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 250
    end
    object FDTableidUnidadeMedida: TLongWordField
      FieldName = 'idUnidadeMedida'
      Origin = 'idUnidadeMedida'
      Required = True
    end
    object FDTableLoockupUnidadeMedida: TStringField
      FieldKind = fkLookup
      FieldName = 'LoockupUnidadeMedida'
      LookupDataSet = FDTableLookup
      LookupKeyFields = 'Id'
      LookupResultField = 'Descricao'
      KeyFields = 'idUnidadeMedida'
      Size = 100
      Lookup = True
    end
    object FDTableLookupUnidadeMedida: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupUnidadeMedida'
      LookupDataSet = FDTableLookup
      LookupKeyFields = 'Id'
      LookupResultField = 'Descricao'
      KeyFields = 'idUnidadeMedida'
      Size = 100
      Lookup = True
    end
  end
  object FDTableLookup: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'devs2blu.unidademedida'
    Left = 416
    Top = 64
    object FDTableLookupId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDTableLookupDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 100
    end
  end
  object DataSource1: TDataSource
    DataSet = FDTableLookup
    Left = 488
    Top = 56
  end
end
