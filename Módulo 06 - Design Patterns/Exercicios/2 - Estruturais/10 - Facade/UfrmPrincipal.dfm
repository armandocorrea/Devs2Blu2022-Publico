object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Facade'
  ClientHeight = 322
  ClientWidth = 534
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnCalcular: TButton
    Left = 24
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 0
    OnClick = btnCalcularClick
  end
  object Memo1: TMemo
    Left = 24
    Top = 55
    Width = 225
    Height = 170
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
  end
end
