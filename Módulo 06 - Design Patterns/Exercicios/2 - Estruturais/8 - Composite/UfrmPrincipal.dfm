object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Composite'
  ClientHeight = 242
  ClientWidth = 527
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object btnUnica: TButton
    Left = 56
    Top = 56
    Width = 75
    Height = 25
    Caption = 'Viagem '#218'nica'
    TabOrder = 0
    OnClick = btnUnicaClick
  end
  object btnPacote: TButton
    Left = 152
    Top = 56
    Width = 105
    Height = 25
    Caption = 'Pacote de Viagens'
    TabOrder = 1
    OnClick = btnPacoteClick
  end
end
