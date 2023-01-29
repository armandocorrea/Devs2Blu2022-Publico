object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'State'
  ClientHeight = 356
  ClientWidth = 441
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
    Left = 13
    Top = 19
    Width = 50
    Height = 13
    Caption = 'Descri'#231#227'o:'
  end
  object Label2: TLabel
    Left = 31
    Top = 48
    Width = 32
    Height = 13
    Caption = 'Qtde.:'
  end
  object Label3: TLabel
    Left = 194
    Top = 48
    Width = 28
    Height = 13
    Caption = 'Valor:'
  end
  object Shape1: TShape
    Left = 347
    Top = 15
    Width = 1
    Height = 51
  end
  object Label4: TLabel
    Left = 13
    Top = 259
    Width = 49
    Height = 13
    Caption = 'Desconto:'
  end
  object Label5: TLabel
    Left = 32
    Top = 291
    Width = 30
    Height = 13
    Caption = 'Frete:'
  end
  object Label6: TLabel
    Left = 34
    Top = 323
    Width = 28
    Height = 13
    Caption = 'Total:'
  end
  object Label7: TLabel
    Left = 285
    Top = 255
    Width = 101
    Height = 13
    Caption = 'Categoria do Pedido:'
  end
  object btnAdicionar: TButton
    Left = 356
    Top = 15
    Width = 73
    Height = 21
    Caption = 'Adicionar'
    TabOrder = 3
    OnClick = btnAdicionarClick
  end
  object edtDescricao: TEdit
    Left = 67
    Top = 15
    Width = 261
    Height = 21
    TabOrder = 0
  end
  object edtValor: TEdit
    Left = 225
    Top = 45
    Width = 103
    Height = 21
    TabOrder = 2
  end
  object edtQuantidade: TEdit
    Left = 67
    Top = 45
    Width = 61
    Height = 21
    TabOrder = 1
  end
  object DBGrid1: TDBGrid
    Left = 13
    Top = 76
    Width = 416
    Height = 165
    TabStop = False
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
        FieldName = 'Descricao'
        Width = 180
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Quantidade'
        Title.Alignment = taCenter
        Title.Caption = 'Qtde'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Valor'
        Title.Alignment = taCenter
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Total'
        Title.Alignment = taCenter
        Visible = True
      end>
  end
  object edtDesconto: TEdit
    Left = 66
    Top = 255
    Width = 135
    Height = 21
    ReadOnly = True
    TabOrder = 5
  end
  object edtFrete: TEdit
    Left = 66
    Top = 286
    Width = 135
    Height = 21
    ReadOnly = True
    TabOrder = 6
  end
  object edtTotal: TEdit
    Left = 67
    Top = 318
    Width = 135
    Height = 21
    ReadOnly = True
    TabOrder = 7
  end
  object Panel1: TPanel
    Left = 244
    Top = 274
    Width = 185
    Height = 62
    BevelKind = bkSoft
    Caption = 'Bronze'
    TabOrder = 8
  end
  object btnRemover: TButton
    Left = 356
    Top = 45
    Width = 73
    Height = 21
    Caption = 'Remover'
    TabOrder = 9
    TabStop = False
    OnClick = btnRemoverClick
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      670000009619E0BD010000001800000004000000000003000000670009446573
      63726963616F01004900000001000557494454480200020064000A5175616E74
      696461646508000400000000000556616C6F72080004000000000005546F7461
      6C08000400000000000000}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 88
    Top = 152
    object ClientDataSet1Descricao: TStringField
      FieldName = 'Descricao'
      Size = 100
    end
    object ClientDataSet1Quantidade: TFloatField
      FieldName = 'Quantidade'
    end
    object ClientDataSet1Valor: TFloatField
      FieldName = 'Valor'
    end
    object ClientDataSet1Total: TFloatField
      FieldName = 'Total'
    end
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 176
    Top = 160
  end
end
