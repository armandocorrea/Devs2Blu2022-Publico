object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Criando Arquivo Texto'
  ClientHeight = 97
  ClientWidth = 126
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
    Left = 16
    Top = 16
    Width = 99
    Height = 13
    Caption = 'Informe um N'#250'mero:'
  end
  object edtNumero: TEdit
    Left = 16
    Top = 35
    Width = 99
    Height = 21
    TabOrder = 0
  end
  object btnTabuada: TButton
    Left = 16
    Top = 62
    Width = 99
    Height = 25
    Caption = 'Tabuada'
    TabOrder = 1
    OnClick = btnTabuadaClick
  end
end
