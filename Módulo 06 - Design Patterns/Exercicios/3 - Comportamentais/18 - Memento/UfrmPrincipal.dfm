object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Memento'
  ClientHeight = 367
  ClientWidth = 527
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
    Left = 8
    Top = 6
    Width = 134
    Height = 13
    Caption = 'Hist'#243'rico de Altera'#231#245'es:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 215
    Top = 24
    Width = 35
    Height = 13
    Caption = 'T'#237'tulo:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 201
    Height = 335
    ItemHeight = 13
    TabOrder = 0
    OnClick = ListBox1Click
  end
  object edtTitulo: TEdit
    Left = 215
    Top = 43
    Width = 304
    Height = 21
    TabOrder = 1
    Text = 'T'#237'tulo do Texto'
  end
  object GroupBox1: TGroupBox
    Left = 215
    Top = 70
    Width = 304
    Height = 45
    TabOrder = 2
    object Button1: TButton
      Left = 3
      Top = 4
      Width = 31
      Height = 34
      Caption = 'N'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 37
      Top = 4
      Width = 31
      Height = 34
      Caption = 'I'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 1
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 71
      Top = 4
      Width = 31
      Height = 34
      Caption = 'S'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = [fsUnderline]
      ParentFont = False
      TabOrder = 2
      OnClick = Button3Click
    end
    object ColorBox1: TColorBox
      Left = 108
      Top = 10
      Width = 91
      Height = 22
      TabOrder = 3
      OnChange = ColorBox1Change
    end
  end
  object RichEdit1: TRichEdit
    Left = 215
    Top = 121
    Width = 304
    Height = 200
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    Zoom = 100
  end
  object btnSalvar: TButton
    Left = 242
    Top = 330
    Width = 255
    Height = 29
    Caption = 'Salvar Altera'#231#245'es'
    TabOrder = 4
    OnClick = btnSalvarClick
  end
end
