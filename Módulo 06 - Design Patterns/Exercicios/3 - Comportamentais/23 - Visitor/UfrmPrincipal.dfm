object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Visitor'
  ClientHeight = 346
  ClientWidth = 582
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
    Top = 10
    Width = 31
    Height = 13
    Caption = 'Nome:'
  end
  object Label2: TLabel
    Left = 159
    Top = 10
    Width = 39
    Height = 13
    Caption = 'Fun'#231#227'o:'
  end
  object Label3: TLabel
    Left = 260
    Top = 10
    Width = 49
    Height = 13
    Caption = 'Admiss'#227'o:'
  end
  object Label4: TLabel
    Left = 364
    Top = 10
    Width = 36
    Height = 13
    Caption = 'Sal'#225'rio:'
  end
  object Shape1: TShape
    Left = 484
    Top = 10
    Width = 1
    Height = 43
  end
  object btnAdicionar: TButton
    Left = 498
    Top = 19
    Width = 75
    Height = 25
    Caption = 'Adicionar'
    TabOrder = 0
    OnClick = btnAdicionarClick
  end
  object edtNome: TEdit
    Left = 16
    Top = 29
    Width = 137
    Height = 21
    TabOrder = 1
  end
  object edtSalario: TEdit
    Left = 364
    Top = 29
    Width = 110
    Height = 21
    TabOrder = 2
  end
  object cmbFuncao: TComboBox
    Left = 159
    Top = 29
    Width = 95
    Height = 21
    Style = csDropDownList
    ItemIndex = 0
    TabOrder = 3
    Text = 'Programador'
    Items.Strings = (
      'Programador'
      'Gerente')
  end
  object edtAdmissao: TDateTimePicker
    Left = 260
    Top = 29
    Width = 97
    Height = 21
    Date = 44954.000000000000000000
    Time = 0.783694780089717800
    TabOrder = 4
  end
  object Panel1: TPanel
    Left = 0
    Top = 304
    Width = 582
    Height = 42
    Align = alBottom
    BevelOuter = bvLowered
    TabOrder = 5
    ExplicitTop = 336
    object Button1: TButton
      Left = 112
      Top = 8
      Width = 142
      Height = 25
      Caption = 'Calcular Novos Sal'#225'rios'
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 272
      Top = 8
      Width = 142
      Height = 25
      Caption = 'Identificar Senioriade'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object StringGrid1: TStringGrid
    Tag = 5
    Left = 16
    Top = 56
    Width = 557
    Height = 242
    FixedCols = 0
    RowCount = 2
    TabOrder = 6
    ColWidths = (
      200
      80
      90
      90
      64)
    ColAligments = (
      0
      0
      0
      0
      0)
  end
  object AdapterBindSource: TAdapterBindSource
    AutoActivate = True
    OnCreateAdapter = AdapterBindSourceCreateAdapter
    ScopeMappings = <>
    Left = 408
    Top = 96
  end
  object BindingsList: TBindingsList
    Methods = <>
    OutputConverters = <>
    Left = 324
    Top = 77
    object LinkGridToDataSourceAdapterBindSource: TLinkGridToDataSource
      Category = 'Quick Bindings'
      DataSource = AdapterBindSource
      GridControl = StringGrid1
      Columns = <
        item
          MemberName = 'Nome'
          Width = 200
        end
        item
          MemberName = 'Funcao'
          Width = 80
        end
        item
          MemberName = 'Admissao'
          Width = 90
        end
        item
          MemberName = 'Salario'
          Width = 90
        end
        item
          MemberName = 'Senioridade'
        end>
    end
  end
end
