object frmPrimeiraClasse: TfrmPrimeiraClasse
  Left = 543
  Top = 304
  Caption = 'Minha Primeira Classe'
  ClientHeight = 224
  ClientWidth = 297
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
    Left = 125
    Top = 8
    Width = 62
    Height = 15
    Caption = 'Triangulo X'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 40
    Width = 9
    Height = 13
    Caption = 'a:'
  end
  object Label3: TLabel
    Left = 111
    Top = 40
    Width = 10
    Height = 13
    Caption = 'b:'
  end
  object Label4: TLabel
    Left = 199
    Top = 40
    Width = 8
    Height = 13
    Caption = 'c:'
  end
  object Label5: TLabel
    Left = 125
    Top = 72
    Width = 61
    Height = 15
    Caption = 'Triangulo Y'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 104
    Width = 9
    Height = 13
    Caption = 'a:'
  end
  object Label7: TLabel
    Left = 111
    Top = 104
    Width = 10
    Height = 13
    Caption = 'b:'
  end
  object Label8: TLabel
    Left = 199
    Top = 104
    Width = 8
    Height = 13
    Caption = 'c:'
  end
  object lblResultado: TLabel
    Left = 24
    Top = 200
    Width = 55
    Height = 15
    Caption = 'Resultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAreaTrianguloY: TLabel
    Left = 24
    Top = 184
    Width = 93
    Height = 15
    Caption = 'Triangulo Y '#193'rea:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lblAreaTrianguloX: TLabel
    Left = 24
    Top = 168
    Width = 94
    Height = 15
    Caption = 'Triangulo X '#193'rea:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object edtX_A: TEdit
    Left = 38
    Top = 34
    Width = 65
    Height = 21
    TabOrder = 0
  end
  object edtX_B: TEdit
    Left = 126
    Top = 34
    Width = 65
    Height = 21
    TabOrder = 1
  end
  object edtX_C: TEdit
    Left = 213
    Top = 34
    Width = 65
    Height = 21
    TabOrder = 2
  end
  object edtY_A: TEdit
    Left = 38
    Top = 98
    Width = 65
    Height = 21
    TabOrder = 3
  end
  object edtY_B: TEdit
    Left = 126
    Top = 98
    Width = 65
    Height = 21
    TabOrder = 4
  end
  object edtY_C: TEdit
    Left = 213
    Top = 98
    Width = 65
    Height = 21
    TabOrder = 5
  end
  object btnCalcular: TButton
    Left = 57
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 6
    OnClick = btnCalcularClick
  end
  object btnCalcularOOP: TButton
    Left = 153
    Top = 134
    Width = 75
    Height = 25
    Caption = 'Calcular OOP'
    TabOrder = 7
    OnClick = btnCalcularOOPClick
  end
end
