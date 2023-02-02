object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Observer'
  ClientHeight = 472
  ClientWidth = 640
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inline fraCadastro1: TfraCadastro
    Left = 0
    Top = 0
    Width = 320
    Height = 472
    TabOrder = 0
    ExplicitHeight = 472
    inherited DBGrid1: TDBGrid
      Height = 382
    end
  end
  inline fraSaldo1: TfraSaldo
    Left = 320
    Top = 0
    Width = 314
    Height = 114
    TabOrder = 1
    ExplicitLeft = 320
    ExplicitWidth = 314
  end
  inline fraHistorico1: TfraHistorico
    Left = 319
    Top = 120
    Width = 320
    Height = 183
    TabOrder = 2
    ExplicitLeft = 319
    ExplicitTop = 120
  end
  inline fraLog1: TfraLog
    Left = 320
    Top = 303
    Width = 320
    Height = 170
    TabOrder = 3
    ExplicitLeft = 320
    ExplicitTop = 303
  end
end
