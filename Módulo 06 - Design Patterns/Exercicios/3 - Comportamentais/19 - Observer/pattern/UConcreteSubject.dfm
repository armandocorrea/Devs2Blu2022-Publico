object fraCadastro: TfraCadastro
  Left = 0
  Top = 0
  Width = 320
  Height = 215
  TabOrder = 0
  object Label1: TLabel
    Left = 16
    Top = 12
    Width = 51
    Height = 13
    Caption = 'Opera'#231#227'o:'
  end
  object Label2: TLabel
    Left = 16
    Top = 39
    Width = 51
    Height = 13
    Caption = 'Categoria:'
  end
  object Label3: TLabel
    Left = 39
    Top = 66
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Shape1: TShape
    Left = 209
    Top = 8
    Width = 3
    Height = 75
  end
  object cmbOperacao: TComboBox
    Left = 73
    Top = 8
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 0
    OnChange = cmbOperacaoChange
    Items.Strings = (
      'Cr'#233'dito'
      'D'#233'bito')
  end
  object cmbCategoria: TComboBox
    Left = 73
    Top = 35
    Width = 121
    Height = 21
    Style = csDropDownList
    TabOrder = 1
  end
  object edtValor: TEdit
    Left = 73
    Top = 62
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnGravar: TButton
    Left = 234
    Top = 12
    Width = 75
    Height = 67
    Caption = 'Gravar'
    TabOrder = 3
    OnClick = btnGravarClick
  end
  object DBGrid1: TDBGrid
    Left = 2
    Top = 89
    Width = 316
    Height = 124
    DataSource = DataSource1
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Operacao'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Categoria'
        Width = 100
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Visible = True
      end>
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      770000009619E0BD0100000018000000030000000000030000007700084F7065
      726163616F01004900000001000557494454480200020032000943617465676F
      72696101004900000001000557494454480200020064000556616C6F72080004
      000000010007535542545950450200490006004D6F6E6579000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 64
    Top = 152
    object ClientDataSet1Operacao: TStringField
      FieldName = 'Operacao'
      Size = 50
    end
    object ClientDataSet1Categoria: TStringField
      FieldName = 'Categoria'
      Size = 100
    end
    object ClientDataSet1Valor: TCurrencyField
      FieldName = 'Valor'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 144
    Top = 152
  end
end
