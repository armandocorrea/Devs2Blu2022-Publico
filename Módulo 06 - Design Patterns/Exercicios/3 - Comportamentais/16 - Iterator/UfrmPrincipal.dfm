object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Iterator'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ListBox1: TListBox
    Left = 16
    Top = 40
    Width = 249
    Height = 177
    ItemHeight = 13
    TabOrder = 0
  end
  object btnCarregarCSV: TButton
    Left = 190
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Carregar CSV'
    TabOrder = 1
    OnClick = btnCarregarCSVClick
  end
  object btnCarregarXML: TButton
    Left = 109
    Top = 9
    Width = 75
    Height = 25
    Caption = 'Carregar XML'
    TabOrder = 2
    OnClick = btnCarregarXMLClick
  end
end
