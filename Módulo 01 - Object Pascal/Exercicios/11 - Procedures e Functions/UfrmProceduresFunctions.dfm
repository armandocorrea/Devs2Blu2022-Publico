object frmProceduresFunctions: TfrmProceduresFunctions
  Left = 0
  Top = 0
  Caption = 'Procedures e Functions'
  ClientHeight = 151
  ClientWidth = 362
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnProcedure: TButton
    Left = 16
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Procedure'
    TabOrder = 0
    OnClick = btnProcedureClick
  end
  object btnFunction: TButton
    Left = 97
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Function'
    TabOrder = 1
    OnClick = btnFunctionClick
  end
  object btnReferencia: TButton
    Left = 16
    Top = 47
    Width = 156
    Height = 25
    Caption = 'Parametros Refer'#234'ncia'
    TabOrder = 2
    OnClick = btnReferenciaClick
  end
  object btnConstante: TButton
    Left = 16
    Top = 78
    Width = 156
    Height = 25
    Caption = 'Parametros Constante'
    TabOrder = 3
    OnClick = btnConstanteClick
  end
  object btnArrayAberto: TButton
    Left = 192
    Top = 16
    Width = 156
    Height = 25
    Caption = 'Array Aberto'
    TabOrder = 4
    OnClick = btnArrayAbertoClick
  end
  object btnSobrecarga: TButton
    Left = 192
    Top = 47
    Width = 156
    Height = 25
    Caption = 'Sobrecarga de Fun'#231#245'es'
    TabOrder = 5
    OnClick = btnSobrecargaClick
  end
  object btnDefault: TButton
    Left = 16
    Top = 109
    Width = 156
    Height = 25
    Caption = 'Parametros Default'
    TabOrder = 6
    OnClick = btnDefaultClick
  end
  object btnForward: TButton
    Left = 192
    Top = 78
    Width = 156
    Height = 25
    Caption = 'Declara'#231#227'o Forward'
    TabOrder = 7
    OnClick = btnForwardClick
  end
end
