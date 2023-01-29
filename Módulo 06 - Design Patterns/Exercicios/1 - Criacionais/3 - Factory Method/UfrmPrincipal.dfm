object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Factory Method'
  ClientHeight = 495
  ClientWidth = 494
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
    Left = 8
    Top = 8
    Width = 56
    Height = 13
    Caption = 'Valor Atual:'
  end
  object Label2: TLabel
    Left = 135
    Top = 8
    Width = 69
    Height = 13
    Caption = 'Qtd. Parcelas:'
  end
  object Label3: TLabel
    Left = 230
    Top = 8
    Width = 103
    Height = 13
    Caption = 'Prazo de Pagamento:'
  end
  object edtValor: TEdit
    Left = 8
    Top = 25
    Width = 121
    Height = 21
    TabOrder = 0
  end
  object edtQtdParcelas: TEdit
    Left = 135
    Top = 25
    Width = 89
    Height = 21
    TabOrder = 1
  end
  object cmbPrazoPagamento: TComboBox
    Left = 230
    Top = 25
    Width = 145
    Height = 21
    Style = csDropDownList
    TabOrder = 2
    Items.Strings = (
      'Mensal'
      'Anual')
  end
  object btnGerar: TButton
    Left = 385
    Top = 23
    Width = 94
    Height = 25
    Caption = 'Gerar Proje'#231#227'o'
    TabOrder = 3
    OnClick = btnGerarClick
  end
  object Memo1: TMemo
    Left = 8
    Top = 52
    Width = 471
    Height = 429
    TabOrder = 4
  end
end
