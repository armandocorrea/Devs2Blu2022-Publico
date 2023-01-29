object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 285
  ClientWidth = 446
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
  object Edit1: TEdit
    Left = 16
    Top = 16
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Edit1'
  end
  object Memo1: TMemo
    Left = 176
    Top = 16
    Width = 249
    Height = 253
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnPush: TButton
    Left = 16
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Push'
    TabOrder = 2
    OnClick = btnPushClick
  end
  object btnPop: TButton
    Left = 16
    Top = 88
    Width = 75
    Height = 25
    Caption = 'Pop'
    TabOrder = 3
    OnClick = btnPopClick
  end
  object btnExtract: TButton
    Left = 16
    Top = 120
    Width = 75
    Height = 25
    Caption = 'Extract'
    TabOrder = 4
    OnClick = btnExtractClick
  end
  object btnPeek: TButton
    Left = 16
    Top = 151
    Width = 75
    Height = 25
    Caption = 'Peek'
    TabOrder = 5
    OnClick = btnPeekClick
  end
  object btnTrimExcess: TButton
    Left = 16
    Top = 182
    Width = 75
    Height = 25
    Caption = 'TrimExcess'
    TabOrder = 6
    OnClick = btnTrimExcessClick
  end
  object btnCount: TButton
    Left = 16
    Top = 213
    Width = 75
    Height = 25
    Caption = 'Count'
    TabOrder = 7
    OnClick = btnCountClick
  end
  object btnCapacity: TButton
    Left = 16
    Top = 244
    Width = 75
    Height = 25
    Caption = 'Capacity'
    TabOrder = 8
    OnClick = btnCapacityClick
  end
end
