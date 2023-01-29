object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'frmPrincipal'
  ClientHeight = 277
  ClientWidth = 470
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
    Left = 152
    Top = 16
    Width = 297
    Height = 241
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
  object btnEnqueue: TButton
    Left = 16
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Enqueue'
    TabOrder = 2
    OnClick = btnEnqueueClick
  end
  object btnDequeue: TButton
    Left = 16
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Dequeue'
    TabOrder = 3
    OnClick = btnDequeueClick
  end
  object btnExtract: TButton
    Left = 16
    Top = 104
    Width = 75
    Height = 25
    Caption = 'Extract'
    TabOrder = 4
    OnClick = btnExtractClick
  end
  object btnPeek: TButton
    Left = 16
    Top = 136
    Width = 75
    Height = 25
    Caption = 'Peek'
    TabOrder = 5
    OnClick = btnPeekClick
  end
  object btnTrimExcess: TButton
    Left = 16
    Top = 168
    Width = 75
    Height = 25
    Caption = 'TrimExcess'
    TabOrder = 6
    OnClick = btnTrimExcessClick
  end
  object btnCount: TButton
    Left = 16
    Top = 200
    Width = 75
    Height = 25
    Caption = 'Count'
    TabOrder = 7
    OnClick = btnCountClick
  end
  object btnCapacity: TButton
    Left = 16
    Top = 232
    Width = 75
    Height = 25
    Caption = 'Capacity'
    TabOrder = 8
    OnClick = btnCapacityClick
  end
end
