object frmPedidos: TfrmPedidos
  Left = 0
  Top = 0
  Caption = 'Pedidos'
  ClientHeight = 373
  ClientWidth = 608
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
    Left = 16
    Top = 48
    Width = 10
    Height = 13
    Caption = 'Id'
    FocusControl = DBEdit1
  end
  object Label2: TLabel
    Left = 87
    Top = 48
    Width = 37
    Height = 13
    Caption = 'N'#250'mero'
    FocusControl = DBEdit2
  end
  object Label3: TLabel
    Left = 227
    Top = 48
    Width = 58
    Height = 13
    Caption = 'Data Pedido'
    FocusControl = DBEdit3
  end
  object Label4: TLabel
    Left = 16
    Top = 91
    Width = 53
    Height = 13
    Caption = 'Comprador'
  end
  object Label5: TLabel
    Left = 16
    Top = 134
    Width = 55
    Height = 13
    Caption = 'Fornecedor'
  end
  object Label6: TLabel
    Left = 120
    Top = 184
    Width = 101
    Height = 16
    Caption = 'Itens do Pedido'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsUnderline]
    ParentFont = False
  end
  object DBNavigator1: TDBNavigator
    Left = 16
    Top = 8
    Width = 240
    Height = 25
    DataSource = dtsPedidoCompra
    TabOrder = 0
  end
  object DBEdit1: TDBEdit
    Left = 16
    Top = 64
    Width = 65
    Height = 21
    TabStop = False
    DataField = 'Id'
    DataSource = dtsPedidoCompra
    ReadOnly = True
    TabOrder = 1
  end
  object DBEdit2: TDBEdit
    Left = 87
    Top = 64
    Width = 134
    Height = 21
    DataField = 'Numero'
    DataSource = dtsPedidoCompra
    TabOrder = 2
  end
  object DBEdit3: TDBEdit
    Left = 227
    Top = 64
    Width = 158
    Height = 21
    DataField = 'DataPedido'
    DataSource = dtsPedidoCompra
    TabOrder = 3
  end
  object DBLookupComboBox1: TDBLookupComboBox
    Left = 16
    Top = 106
    Width = 369
    Height = 21
    DataField = 'idComprador'
    DataSource = dtsPedidoCompra
    KeyField = 'Id'
    ListField = 'Nome'
    ListSource = dtsLookupComprador
    TabOrder = 4
  end
  object DBLookupComboBox2: TDBLookupComboBox
    Left = 16
    Top = 150
    Width = 369
    Height = 21
    DataField = 'idFornecedor'
    DataSource = dtsPedidoCompra
    KeyField = 'Id'
    ListField = 'Nome'
    ListSource = dtsLookupFornecedor
    TabOrder = 5
  end
  object DBGrid1: TDBGrid
    Left = 16
    Top = 206
    Width = 369
    Height = 155
    DataSource = dtsItemCompra
    TabOrder = 6
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idProduto'
        Title.Caption = 'id Produto'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'LookupProduto'
        Title.Caption = 'Descri'#231#227'o Produto'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Visible = True
      end>
  end
  object DBNavigator2: TDBNavigator
    Left = 386
    Top = 206
    Width = 25
    Height = 155
    DataSource = dtsItemCompra
    VisibleButtons = [nbInsert, nbDelete, nbEdit, nbPost, nbCancel]
    Kind = dbnVertical
    TabOrder = 7
  end
  object PedidoCompra: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'pedidocompra'
    Left = 392
    Top = 8
    object PedidoCompraId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object PedidoCompraNumero: TLongWordField
      FieldName = 'Numero'
      Origin = 'Numero'
      Required = True
    end
    object PedidoCompraDataPedido: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DataPedido'
      Origin = 'DataPedido'
    end
    object PedidoCompraidComprador: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'idComprador'
      Origin = 'idComprador'
    end
    object PedidoCompraidFornecedor: TLongWordField
      AutoGenerateValue = arDefault
      FieldName = 'idFornecedor'
      Origin = 'idFornecedor'
    end
  end
  object dtsPedidoCompra: TDataSource
    DataSet = PedidoCompra
    Left = 304
    Top = 8
  end
  object dtsLookupComprador: TDataSource
    DataSet = LookupComprador
    Left = 408
    Top = 96
  end
  object LookupComprador: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'Comprador'
    Left = 512
    Top = 96
    object LookupCompradorId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object LookupCompradorNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 250
    end
    object LookupCompradorCargo: TStringField
      FieldName = 'Cargo'
      Origin = 'Cargo'
      Required = True
      Size = 50
    end
  end
  object dtsLookupFornecedor: TDataSource
    DataSet = LookupFornecedor
    Left = 408
    Top = 144
  end
  object LookupFornecedor: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'fornecedor'
    Left = 512
    Top = 144
    object LookupFornecedorId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object LookupFornecedorCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      Size = 14
    end
    object LookupFornecedorNome: TStringField
      FieldName = 'Nome'
      Origin = 'Nome'
      Required = True
      Size = 250
    end
  end
  object dtsItemCompra: TDataSource
    DataSet = ItemCompra
    Left = 440
    Top = 224
  end
  object ItemCompra: TFDTable
    BeforePost = ItemCompraBeforePost
    IndexFieldNames = 'idPedidoCompra'
    MasterSource = dtsPedidoCompra
    MasterFields = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'itemcompra'
    Left = 520
    Top = 224
    object ItemCompraId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object ItemCompraidPedidoCompra: TLongWordField
      FieldName = 'idPedidoCompra'
      Origin = 'idPedidoCompra'
      Required = True
    end
    object ItemCompraidProduto: TLongWordField
      FieldName = 'idProduto'
      Origin = 'idProduto'
      Required = True
    end
    object ItemCompraLookupProduto: TStringField
      FieldKind = fkLookup
      FieldName = 'LookupProduto'
      LookupDataSet = LookupProdutos
      LookupKeyFields = 'Id'
      LookupResultField = 'Descricao'
      KeyFields = 'idProduto'
      Size = 250
      Lookup = True
    end
    object ItemCompraQuantidade: TFloatField
      FieldName = 'Quantidade'
      Origin = 'Quantidade'
      Required = True
    end
  end
  object LookupProdutos: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'produto'
    Left = 520
    Top = 288
    object LookupProdutosId: TFDAutoIncField
      FieldName = 'Id'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object LookupProdutosDescricao: TStringField
      FieldName = 'Descricao'
      Origin = 'Descricao'
      Required = True
      Size = 250
    end
    object LookupProdutosidUnidadeMedida: TLongWordField
      FieldName = 'idUnidadeMedida'
      Origin = 'idUnidadeMedida'
      Required = True
    end
  end
end
