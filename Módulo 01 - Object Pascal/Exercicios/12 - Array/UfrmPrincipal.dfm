object Form6: TForm6
  Left = 0
  Top = 0
  Caption = 'Arrays e Records'
  ClientHeight = 216
  ClientWidth = 190
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object edtDia: TEdit
    Left = 16
    Top = 23
    Width = 73
    Height = 21
    TabOrder = 0
    Text = 'Dia'
  end
  object edtTemperatura: TEdit
    Left = 16
    Top = 50
    Width = 73
    Height = 21
    TabOrder = 1
    Text = 'Temperatura'
  end
  object Button1: TButton
    Left = 100
    Top = 21
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 2
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 100
    Top = 48
    Width = 75
    Height = 25
    Caption = 'Consultar'
    TabOrder = 3
    OnClick = Button2Click
  end
  object mmHistorico: TMemo
    Left = 16
    Top = 85
    Width = 159
    Height = 117
    TabOrder = 4
  end
end
