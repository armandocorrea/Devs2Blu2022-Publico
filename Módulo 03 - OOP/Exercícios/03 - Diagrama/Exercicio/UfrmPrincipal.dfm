object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Cadastro de Pessoas'
  ClientHeight = 306
  ClientWidth = 291
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
    Left = 18
    Top = 32
    Width = 27
    Height = 13
    Caption = 'Nome'
  end
  object Label2: TLabel
    Left = 18
    Top = 88
    Width = 45
    Height = 13
    Caption = 'Endere'#231'o'
  end
  object Label3: TLabel
    Left = 153
    Top = 88
    Width = 19
    Height = 13
    Caption = 'CEP'
  end
  object Label4: TLabel
    Left = 18
    Top = 144
    Width = 42
    Height = 13
    Caption = 'Telefone'
  end
  object Label5: TLabel
    Left = 153
    Top = 144
    Width = 31
    Height = 13
    Caption = 'Renda'
  end
  object Label6: TLabel
    Left = 18
    Top = 198
    Width = 41
    Height = 13
    Caption = 'Situa'#231#227'o'
  end
  object lblDocumento: TLabel
    Left = 153
    Top = 198
    Width = 19
    Height = 13
    Caption = 'CPF'
  end
  object rgPessoa: TRadioGroup
    Left = 178
    Top = 8
    Width = 97
    Height = 81
    Caption = 'Pessoa'
    ItemIndex = 0
    Items.Strings = (
      'F'#237'sica'
      'Jur'#237'dica')
    TabOrder = 0
    OnClick = rgPessoaClick
  end
  object edtNome: TEdit
    Left = 18
    Top = 51
    Width = 121
    Height = 21
    TabOrder = 1
  end
  object edtEndereco: TEdit
    Left = 18
    Top = 107
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtCEP: TEdit
    Left = 153
    Top = 107
    Width = 121
    Height = 21
    TabOrder = 3
  end
  object edtTelefone: TEdit
    Left = 18
    Top = 163
    Width = 121
    Height = 21
    TabOrder = 4
  end
  object edtRenda: TEdit
    Left = 153
    Top = 163
    Width = 121
    Height = 21
    TabOrder = 5
  end
  object edtDocumento: TEdit
    Left = 153
    Top = 217
    Width = 121
    Height = 21
    TabOrder = 7
  end
  object btnGravar: TButton
    Left = 199
    Top = 264
    Width = 75
    Height = 25
    Caption = 'Gravar'
    TabOrder = 8
    OnClick = btnGravarClick
  end
  object cmbSituacao: TComboBox
    Left = 18
    Top = 217
    Width = 121
    Height = 21
    TabOrder = 6
    Text = 'Ativo'#11
    Items.Strings = (
      'Ativo'
      'Inativo')
  end
end
