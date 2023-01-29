object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Mediator'
  ClientHeight = 322
  ClientWidth = 603
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
    Top = 20
    Width = 78
    Height = 13
    Caption = 'Membros online:'
  end
  object btnNovo: TButton
    Left = 143
    Top = 8
    Width = 25
    Height = 25
    Caption = '+'
    TabOrder = 0
    OnClick = btnNovoClick
  end
  object btnRemover: TButton
    Left = 168
    Top = 8
    Width = 25
    Height = 25
    Caption = '-'
    TabOrder = 1
    OnClick = btnRemoverClick
  end
  object GroupBox1: TGroupBox
    Left = 199
    Top = 39
    Width = 394
    Height = 90
    Caption = 'Envio de Propostas'
    TabOrder = 2
    object Label2: TLabel
      Left = 13
      Top = 30
      Width = 17
      Height = 13
      Caption = 'De:'
    end
    object Label3: TLabel
      Left = 206
      Top = 30
      Width = 26
      Height = 13
      Caption = 'Para:'
    end
    object cmbRemetente: TComboBox
      Left = 34
      Top = 22
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 0
    end
    object cmbDestinatario: TComboBox
      Left = 236
      Top = 22
      Width = 145
      Height = 21
      Style = csDropDownList
      TabOrder = 1
    end
    object edtMensagem: TEdit
      Left = 34
      Top = 56
      Width = 316
      Height = 21
      TabOrder = 2
    end
    object btnEnviar: TButton
      Left = 354
      Top = 54
      Width = 27
      Height = 25
      Caption = '>'
      TabOrder = 3
      OnClick = btnEnviarClick
    end
  end
  object Memo1: TMemo
    Left = 199
    Top = 135
    Width = 394
    Height = 178
    ReadOnly = True
    TabOrder = 3
  end
  object ListBox1: TListBox
    Left = 8
    Top = 39
    Width = 185
    Height = 274
    ItemHeight = 13
    TabOrder = 4
  end
end
