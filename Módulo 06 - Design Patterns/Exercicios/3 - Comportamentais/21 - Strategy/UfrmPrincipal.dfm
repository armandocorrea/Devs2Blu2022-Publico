object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Strategy'
  ClientHeight = 66
  ClientWidth = 455
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 8
    Width = 32
    Height = 13
    Caption = 'E-mail:'
  end
  object Label2: TLabel
    Left = 207
    Top = 8
    Width = 49
    Height = 13
    Caption = 'Algoritmo:'
  end
  object edtEmail: TEdit
    Left = 16
    Top = 24
    Width = 185
    Height = 21
    TabOrder = 0
  end
  object cmbAlgoritmo: TComboBox
    Left = 207
    Top = 24
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 1
    Items.Strings = (
      'DLL'
      'RegExLib'
      'MailBoxLayer')
  end
  object btnValidar: TButton
    Left = 368
    Top = 22
    Width = 75
    Height = 25
    Caption = 'Validar!'
    TabOrder = 2
    OnClick = btnValidarClick
  end
end
