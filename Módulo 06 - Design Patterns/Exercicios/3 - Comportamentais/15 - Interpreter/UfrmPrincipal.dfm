object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Interpreter'
  ClientHeight = 106
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
  object edtEntrada: TEdit
    Left = 16
    Top = 8
    Width = 489
    Height = 21
    TabOrder = 0
  end
  object btnProcessar: TButton
    Left = 16
    Top = 35
    Width = 489
    Height = 25
    Caption = 'Processar'
    TabOrder = 1
    OnClick = btnProcessarClick
  end
  object edtSaida: TEdit
    Left = 16
    Top = 66
    Width = 489
    Height = 21
    TabOrder = 2
  end
end
