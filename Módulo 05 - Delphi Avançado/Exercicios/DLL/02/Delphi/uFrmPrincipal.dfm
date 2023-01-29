object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Consumindo DLL em C#'
  ClientHeight = 89
  ClientWidth = 348
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 9
    Top = 13
    Width = 46
    Height = 13
    Caption = 'N'#250'mero 1'
  end
  object Label2: TLabel
    Left = 136
    Top = 13
    Width = 46
    Height = 13
    Caption = 'N'#250'mero 2'
  end
  object lblResultado: TLabel
    Left = 236
    Top = 59
    Width = 102
    Height = 19
    Alignment = taRightJustify
    Caption = 'lblResultado'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
    Visible = False
  end
  object edtNumero1: TEdit
    Left = 9
    Top = 30
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNumero2: TEdit
    Left = 136
    Top = 30
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object btnCalcular: TButton
    Left = 263
    Top = 28
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = btnCalcularClick
  end
end
