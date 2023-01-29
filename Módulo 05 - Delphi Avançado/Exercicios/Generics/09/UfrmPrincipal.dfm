object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 372
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
    Left = 168
    Top = 16
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object Label2: TLabel
    Left = 304
    Top = 16
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object btnAdd: TButton
    Left = 14
    Top = 16
    Width = 116
    Height = 25
    Caption = 'Add'
    TabOrder = 0
    OnClick = btnAddClick
  end
  object btnTryGetValue: TButton
    Left = 14
    Top = 48
    Width = 116
    Height = 25
    Caption = 'TryGetValue'
    TabOrder = 1
    OnClick = btnTryGetValueClick
  end
  object btnRemove: TButton
    Left = 14
    Top = 79
    Width = 116
    Height = 25
    Caption = 'Remove'
    TabOrder = 2
    OnClick = btnRemoveClick
  end
  object btnTrimExcess: TButton
    Left = 14
    Top = 110
    Width = 116
    Height = 25
    Caption = 'TrimExcess'
    TabOrder = 3
    OnClick = btnTrimExcessClick
  end
  object btnContainsKey: TButton
    Left = 14
    Top = 142
    Width = 116
    Height = 25
    Caption = 'ContainsKey'
    TabOrder = 4
    OnClick = btnContainsKeyClick
  end
  object btnAddOrSetValue: TButton
    Left = 14
    Top = 173
    Width = 116
    Height = 25
    Caption = 'AddOrSetValue'
    TabOrder = 5
    OnClick = btnAddOrSetValueClick
  end
  object btnListaKey: TButton
    Left = 14
    Top = 204
    Width = 116
    Height = 25
    Caption = 'Lista Key'
    TabOrder = 6
    OnClick = btnListaKeyClick
  end
  object btnListaValue: TButton
    Left = 14
    Top = 236
    Width = 116
    Height = 25
    Caption = 'Lista Value'
    TabOrder = 7
    OnClick = btnListaValueClick
  end
  object btnClear: TButton
    Left = 14
    Top = 268
    Width = 116
    Height = 25
    Caption = 'Clear'
    TabOrder = 8
    OnClick = btnClearClick
  end
  object btnOnKeyNotify: TButton
    Left = 14
    Top = 299
    Width = 116
    Height = 25
    Caption = 'OnKeyNotify'
    TabOrder = 9
    OnClick = btnOnKeyNotifyClick
  end
  object btnOnValueNotify: TButton
    Left = 14
    Top = 330
    Width = 116
    Height = 25
    Caption = 'OnValueNotify'
    TabOrder = 10
    OnClick = btnOnValueNotifyClick
  end
  object edtCPF: TEdit
    Left = 168
    Top = 35
    Width = 121
    Height = 21
    TabOrder = 11
    Text = 'edtCPF'
  end
  object edtNome: TEdit
    Left = 304
    Top = 35
    Width = 209
    Height = 21
    TabOrder = 12
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 168
    Top = 62
    Width = 345
    Height = 293
    Lines.Strings = (
      'Memo1')
    TabOrder = 13
  end
end
