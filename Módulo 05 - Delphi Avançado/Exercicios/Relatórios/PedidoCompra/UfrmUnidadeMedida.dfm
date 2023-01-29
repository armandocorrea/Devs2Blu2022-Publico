object frmUnidadeMedida: TfrmUnidadeMedida
  Left = 0
  Top = 0
  Caption = 'Unidade de Medida'
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
    Top = 43
    Width = 10
    Height = 13
    Caption = 'Id'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 14
    Top = 83
    Width = 46
    Height = 13
    Caption = 'Descri'#231#227'o'
    FocusControl = DBEdit2
  end
  object DBGrid1: TDBGrid
    Left = 14
    Top = 126
    Width = 579
    Height = 120
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
        FieldName = 'Descricao'
        Title.Caption = 'Descri'#231#227'o'
        Width = 200
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
    Top = 59
    Width = 134
    Height = 21
    DataField = 'Id'
    DataSource = DataSource
    ReadOnly = True
    TabOrder = 2
  end
  object DBEdit2: TDBEdit
    Left = 14
    Top = 99
    Width = 200
    Height = 21
    DataField = 'Descricao'
    DataSource = DataSource
    TabOrder = 3
  end
  object DataSource: TDataSource
    DataSet = FDTable
    Left = 312
    Top = 40
  end
  object FDTable: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'unidademedida'
    Left = 376
    Top = 40
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
      Size = 100
    end
  end
end
