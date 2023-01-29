object Form1: TForm1
  Left = 304
  Top = 125
  Width = 377
  Height = 248
  Caption = 'Usando a RTL e Tipo de Dados'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 16
    Width = 298
    Height = 30
    Caption = 'Usando a RTL e Tipo de Dados'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 88
    Top = 64
    Width = 60
    Height = 13
    Caption = 'Valor String'
  end
  object lblResultado: TLabel
    Left = 88
    Top = 176
    Width = 61
    Height = 17
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtInput: TEdit
    Left = 88
    Top = 80
    Width = 201
    Height = 21
    TabOrder = 0
  end
  object btnStrToInt: TButton
    Left = 88
    Top = 112
    Width = 97
    Height = 25
    Caption = 'Inteiro'
    TabOrder = 1
    OnClick = btnStrToIntClick
  end
  object bntStrToFloat: TButton
    Left = 192
    Top = 112
    Width = 97
    Height = 25
    Caption = 'Ponto Flutuante'
    TabOrder = 2
    OnClick = bntStrToFloatClick
  end
  object btnStrToDateTime: TButton
    Left = 88
    Top = 144
    Width = 97
    Height = 25
    Caption = 'Data'
    TabOrder = 3
    OnClick = btnStrToDateTimeClick
  end
  object btnDateExt: TButton
    Left = 192
    Top = 144
    Width = 97
    Height = 25
    Caption = 'Data (Extenso)'
    TabOrder = 4
    OnClick = btnDateExtClick
  end
end
