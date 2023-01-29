object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Nota Aluno'
  ClientHeight = 189
  ClientWidth = 459
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
    Left = 24
    Top = 13
    Width = 32
    Height = 13
    Caption = 'Nota 1'
  end
  object Label2: TLabel
    Left = 24
    Top = 59
    Width = 32
    Height = 13
    Caption = 'Nota 2'
  end
  object Label3: TLabel
    Left = 24
    Top = 103
    Width = 42
    Height = 13
    Caption = 'Trabalho'
  end
  object edtNota1: TEdit
    Left = 24
    Top = 32
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtNota2: TEdit
    Left = 24
    Top = 75
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtTrabalho: TEdit
    Left = 24
    Top = 122
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object btnCalcular: TButton
    Left = 70
    Top = 149
    Width = 75
    Height = 25
    Caption = 'Calcular'
    TabOrder = 3
    OnClick = btnCalcularClick
  end
  object mmHistorico: TMemo
    Left = 168
    Top = 13
    Width = 273
    Height = 161
    TabOrder = 4
  end
end
