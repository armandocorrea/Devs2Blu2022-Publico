object frmRelPedidos: TfrmRelPedidos
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rio - Pedidos'
  ClientHeight = 158
  ClientWidth = 350
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
  object GroupBox1: TGroupBox
    Left = 8
    Top = 8
    Width = 329
    Height = 138
    Caption = 'Filtros'
    TabOrder = 0
    object Label4: TLabel
      Left = 13
      Top = 16
      Width = 53
      Height = 13
      Caption = 'Comprador'
    end
    object Label5: TLabel
      Left = 13
      Top = 58
      Width = 55
      Height = 13
      Caption = 'Fornecedor'
    end
    object btnVisualizar: TButton
      Left = 238
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Visualizar'
      TabOrder = 0
      OnClick = btnVisualizarClick
    end
    object btnExportar: TButton
      Left = 157
      Top = 104
      Width = 75
      Height = 25
      Caption = 'Exportar'
      TabOrder = 1
      OnClick = btnExportarClick
    end
    object DBLookupComprador: TDBLookupComboBox
      Left = 13
      Top = 31
      Width = 300
      Height = 21
      DataField = 'idComprador'
      KeyField = 'Id'
      ListField = 'Nome'
      ListSource = dtsLookupComprador
      TabOrder = 2
    end
    object DBLookupFornecedor: TDBLookupComboBox
      Left = 13
      Top = 73
      Width = 300
      Height = 21
      DataField = 'idFornecedor'
      KeyField = 'Id'
      ListField = 'Nome'
      ListSource = dtsLookupFornecedor
      TabOrder = 3
    end
  end
  object frxReport1: TfrxReport
    Version = '2023.1.3'
    DotMatrixReport = False
    IniFile = '\Software\Fast Reports'
    PreviewOptions.Buttons = [pbPrint, pbLoad, pbSave, pbExport, pbZoom, pbFind, pbOutline, pbPageSetup, pbTools, pbEdit, pbNavigator, pbExportQuick, pbCopy, pbSelection]
    PreviewOptions.Zoom = 1.000000000000000000
    PrintOptions.Printer = 'Default'
    PrintOptions.PrintOnSheet = 0
    ReportOptions.CreateDate = 44930.827157650500000000
    ReportOptions.LastChange = 44930.905355081020000000
    ScriptLanguage = 'PascalScript'
    ScriptText.Strings = (
      'begin'
      ''
      'end.')
    Left = 24
    Top = 184
    Datasets = <
      item
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
      end
      item
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
      end>
    Variables = <>
    Style = <>
    object Data: TfrxDataPage
      Height = 1000.000000000000000000
      Width = 1000.000000000000000000
    end
    object Page1: TfrxReportPage
      PaperWidth = 210.000000000000000000
      PaperHeight = 297.000000000000000000
      PaperSize = 9
      LeftMargin = 10.000000000000000000
      RightMargin = 10.000000000000000000
      TopMargin = 10.000000000000000000
      BottomMargin = 10.000000000000000000
      Frame.Typ = []
      MirrorMode = []
      object ReportTitle1: TfrxReportTitle
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 56.692950000000000000
        Top = 18.897650000000000000
        Width = 718.110700000000000000
        object Memo1: TfrxMemoView
          AllowVectorExport = True
          Left = 168.189085000000000000
          Top = 5.669295000000000000
          Width = 381.732530000000000000
          Height = 30.236240000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -27
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haCenter
          Memo.UTF8W = (
            'Relat'#243'rio Pedidos')
          ParentFont = False
        end
      end
      object MasterData1: TfrxMasterData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = []
        Height = 26.456710000000000000
        ParentFont = False
        Top = 181.417440000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset1
        DataSetName = 'frxDBDataset1'
        RowCount = 0
        object Memo4: TfrxMemoView
          AllowVectorExport = True
          Left = 5.559060000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."NUMERO"]')
          ParentFont = False
        end
        object Memo5: TfrxMemoView
          AllowVectorExport = True
          Left = 107.165430000000000000
          Top = 3.779530000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."DATAPEDIDO"]')
          ParentFont = False
        end
        object Memo7: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 3.779530000000000000
          Width = 177.637910000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."COMPRADOR"]')
          ParentFont = False
        end
        object Memo9: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 3.779530000000000000
          Width = 306.141930000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset1."FORNECEDOR"]')
          ParentFont = False
        end
      end
      object Header1: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 136.063080000000000000
        Width = 718.110700000000000000
        object Memo2: TfrxMemoView
          AllowVectorExport = True
          Left = 5.559060000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'N'#250'mero')
          ParentFont = False
        end
        object Memo3: TfrxMemoView
          AllowVectorExport = True
          Left = 107.165430000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Data')
          ParentFont = False
        end
        object Memo6: TfrxMemoView
          AllowVectorExport = True
          Left = 211.653680000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Comprador')
          ParentFont = False
        end
        object Memo8: TfrxMemoView
          AllowVectorExport = True
          Left = 400.630180000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Fornecedor')
          ParentFont = False
        end
      end
      object DetailData1: TfrxDetailData
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 26.456710000000000000
        Top = 275.905690000000000000
        Width = 718.110700000000000000
        DataSet = frxDBDataset2
        DataSetName = 'frxDBDataset2'
        RowCount = 0
        object Memo13: TfrxMemoView
          AllowVectorExport = True
          Left = 59.574830000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."IDPRODUTO"]')
          ParentFont = False
        end
        object Memo14: TfrxMemoView
          AllowVectorExport = True
          Left = 161.401670000000000000
          Width = 192.756030000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          Memo.UTF8W = (
            '[frxDBDataset2."PRODUTO"]')
          ParentFont = False
        end
        object Memo15: TfrxMemoView
          AllowVectorExport = True
          Left = 358.157700000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            '[frxDBDataset2."QUANTIDADE"]')
          ParentFont = False
        end
        object Line1: TfrxLineView
          AllowVectorExport = True
          Left = 60.692950000000000000
          Top = 21.456710000000000000
          Width = 393.071120000000000000
          Color = clBlack
          Frame.Style = fsDot
          Frame.Typ = []
          Diagonal = True
        end
      end
      object Header2: TfrxHeader
        FillType = ftBrush
        FillGap.Top = 0
        FillGap.Left = 0
        FillGap.Bottom = 0
        FillGap.Right = 0
        Frame.Typ = []
        Height = 22.677180000000000000
        Top = 230.551330000000000000
        Width = 718.110700000000000000
        object Memo10: TfrxMemoView
          AllowVectorExport = True
          Left = 59.574830000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Id. Produto')
          ParentFont = False
        end
        object Memo11: TfrxMemoView
          AllowVectorExport = True
          Left = 161.401670000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          Memo.UTF8W = (
            'Descri'#231#227'o')
          ParentFont = False
        end
        object Memo12: TfrxMemoView
          AllowVectorExport = True
          Left = 358.157700000000000000
          Top = 2.000000000000000000
          Width = 94.488250000000000000
          Height = 18.897650000000000000
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          Frame.Typ = []
          HAlign = haRight
          Memo.UTF8W = (
            'Quantidade')
          ParentFont = False
        end
      end
    end
  end
  object QryPedido: TFDQuery
    Connection = dmPedidos.FDConexao
    SQL.Strings = (
      
        'SELECT PEDIDOCOMPRA.ID, PEDIDOCOMPRA.NUMERO,'#10'       PEDIDOCOMPRA' +
        '.DATAPEDIDO,'#10'       COMPRADOR.NOME COMPRADOR,'#10'       COMPRADOR.C' +
        'ARGO,'#10'       FORNECEDOR.NOME FORNECEDOR,'#10'       FORNECEDOR.CNPJ'#10 +
        '  FROM PEDIDOCOMPRA '#10'  LEFT JOIN COMPRADOR ON PEDIDOCOMPRA.IDCOM' +
        'PRADOR = COMPRADOR.ID'#10'  LEFT JOIN FORNECEDOR ON PEDIDOCOMPRA.IDF' +
        'ORNECEDOR = FORNECEDOR.ID WHERE (IDCOMPRADOR = :IDCOMPRADOR OR C' +
        'OALESCE(:IDCOMPRADOR, 0) = 0) AND (IDFORNECEDOR = :IDFORNECEDOR ' +
        'OR COALESCE(:IDFORNECEDOR, 0) = 0)')
    Left = 128
    Top = 184
    ParamData = <
      item
        Name = 'IDCOMPRADOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDFORNECEDOR'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object QryPedidoNUMERO: TLongWordField
      FieldName = 'NUMERO'
      Origin = 'Numero'
      Required = True
    end
    object QryPedidoDATAPEDIDO: TDateField
      AutoGenerateValue = arDefault
      FieldName = 'DATAPEDIDO'
      Origin = 'DataPedido'
    end
    object QryPedidoCOMPRADOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'COMPRADOR'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 250
    end
    object QryPedidoCARGO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CARGO'
      Origin = 'Cargo'
      ProviderFlags = []
      ReadOnly = True
      Size = 50
    end
    object QryPedidoFORNECEDOR: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'FORNECEDOR'
      Origin = 'Nome'
      ProviderFlags = []
      ReadOnly = True
      Size = 250
    end
    object QryPedidoCNPJ: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'CNPJ'
      Origin = 'CNPJ'
      ProviderFlags = []
      ReadOnly = True
      Size = 14
    end
    object QryPedidoID: TFDAutoIncField
      FieldName = 'ID'
      Origin = 'Id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
  end
  object frxDBDataset1: TfrxDBDataset
    UserName = 'frxDBDataset1'
    CloseDataSource = False
    DataSet = QryPedido
    BCDToCurrency = False
    DataSetOptions = []
    Left = 80
    Top = 184
  end
  object frxPDFExport1: TfrxPDFExport
    UseFileCache = True
    ShowProgress = True
    OverwritePrompt = False
    DataOnly = False
    EmbedFontsIfProtected = False
    InteractiveFormsFontSubset = 'A-Z,a-z,0-9,#43-#47 '
    OpenAfterExport = False
    PrintOptimized = False
    Outline = False
    Background = False
    HTMLTags = True
    Quality = 95
    Author = 'FastReport'
    Subject = 'FastReport PDF export'
    Creator = 'FastReport'
    ProtectionFlags = [ePrint, eModify, eCopy, eAnnot]
    HideToolbar = False
    HideMenubar = False
    HideWindowUI = False
    FitWindow = False
    CenterWindow = False
    PrintScaling = False
    PdfA = False
    PDFStandard = psNone
    PDFVersion = pv17
    Left = 176
    Top = 184
  end
  object QryItemCompra: TFDQuery
    Active = True
    IndexFieldNames = 'IdPedidoCompra'
    MasterSource = dtsItemCompra
    MasterFields = 'ID'
    Connection = dmPedidos.FDConexao
    FetchOptions.AssignedValues = [evCache]
    FetchOptions.Cache = [fiBlobs, fiMeta]
    SQL.Strings = (
      
        'SELECT ITEMCOMPRA.IdPedidoCompra, ITEMCOMPRA.IDPRODUTO,'#10'       P' +
        'RODUTO.DESCRICAO PRODUTO,'#10'       ITEMCOMPRA.QUANTIDADE'#10'  FROM IT' +
        'EMCOMPRA'#10'  LEFT JOIN PRODUTO ON PRODUTO.ID = ITEMCOMPRA.IDPRODUT' +
        'O')
    Left = 120
    Top = 240
    object QryItemCompraIDPRODUTO: TLongWordField
      FieldName = 'IDPRODUTO'
      Origin = 'idProduto'
      Required = True
    end
    object QryItemCompraPRODUTO: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'PRODUTO'
      Origin = 'Descricao'
      ProviderFlags = []
      ReadOnly = True
      Size = 250
    end
    object QryItemCompraQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
      Origin = 'Quantidade'
      Required = True
    end
    object QryItemCompraIdPedidoCompra: TLongWordField
      FieldName = 'IdPedidoCompra'
      Origin = 'idPedidoCompra'
      Required = True
    end
  end
  object dtsItemCompra: TDataSource
    DataSet = QryPedido
    Left = 24
    Top = 240
  end
  object frxDBDataset2: TfrxDBDataset
    UserName = 'frxDBDataset2'
    CloseDataSource = False
    DataSet = QryItemCompra
    BCDToCurrency = False
    DataSetOptions = []
    Left = 216
    Top = 240
  end
  object dtsLookupComprador: TDataSource
    DataSet = LookupComprador
    Left = 186
    Top = 8
  end
  object LookupComprador: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'Comprador'
    Left = 290
    Top = 8
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
    Left = 194
    Top = 64
  end
  object LookupFornecedor: TFDTable
    IndexFieldNames = 'Id'
    Connection = dmPedidos.FDConexao
    TableName = 'fornecedor'
    Left = 290
    Top = 64
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
end
