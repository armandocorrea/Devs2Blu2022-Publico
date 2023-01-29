object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Sakila - Relat'#243'rios'
  ClientHeight = 347
  ClientWidth = 456
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 200
    Top = 160
    object Relatrios1: TMenuItem
      Caption = '&Relat'#243'rios'
      object Exerccio011: TMenuItem
        Caption = 'Exerc'#237'cio 01'
        OnClick = Exerccio011Click
      end
      object Exerccio021: TMenuItem
        Caption = 'Exerc'#237'cio 02'
        OnClick = Exerccio021Click
      end
      object Exerccio031: TMenuItem
        Caption = 'Exerc'#237'cio 03'
        OnClick = Exerccio031Click
      end
    end
  end
end
