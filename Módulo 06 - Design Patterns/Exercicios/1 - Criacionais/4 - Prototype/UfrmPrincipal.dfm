object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Prototype'
  ClientHeight = 238
  ClientWidth = 412
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
    Top = 8
    Width = 48
    Height = 13
    Caption = 'Reuni'#245'es:'
  end
  object btnClonar: TButton
    Left = 8
    Top = 191
    Width = 121
    Height = 25
    Caption = 'Clonar'
    TabOrder = 0
    OnClick = btnClonarClick
  end
  object ListBox1: TListBox
    Left = 8
    Top = 24
    Width = 385
    Height = 161
    ItemHeight = 13
    TabOrder = 1
  end
end
