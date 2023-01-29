object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Di'#225'rio da Classe'
  ClientHeight = 448
  ClientWidth = 386
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 16
    Width = 76
    Height = 13
    Caption = 'Nome do Aluno:'
  end
  object Label2: TLabel
    Left = 16
    Top = 64
    Width = 45
    Height = 13
    Caption = '1'#170'. Nota:'
  end
  object Label3: TLabel
    Left = 112
    Top = 64
    Width = 45
    Height = 13
    Caption = '2'#170'. Nota:'
  end
  object btnGravar: TButton
    Left = 200
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Gravar Aluno'
    TabOrder = 0
    OnClick = btnGravarClick
  end
  object btnLer: TButton
    Left = 296
    Top = 81
    Width = 75
    Height = 25
    Caption = 'Ler Alunos'
    TabOrder = 1
    OnClick = btnLerClick
  end
  object edtNome: TEdit
    Left = 16
    Top = 35
    Width = 355
    Height = 21
    TabOrder = 2
  end
  object edtPrimeiraNota: TEdit
    Left = 16
    Top = 83
    Width = 76
    Height = 21
    TabOrder = 3
    OnKeyPress = edtPrimeiraNotaKeyPress
  end
  object edtSegundaNota: TEdit
    Left = 112
    Top = 83
    Width = 76
    Height = 21
    TabOrder = 4
    OnKeyPress = edtPrimeiraNotaKeyPress
  end
  object mmDiario: TMemo
    Left = 16
    Top = 112
    Width = 355
    Height = 321
    TabOrder = 5
  end
end
