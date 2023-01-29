object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Meu Sistema Pessoal'
  ClientHeight = 456
  ClientWidth = 826
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object MainMenu1: TMainMenu
    Left = 120
    Top = 32
    object Cadastros1: TMenuItem
      Caption = 'Cadastros'
      object Clientes1: TMenuItem
        Caption = 'Clientes'
      end
      object Fornecedores1: TMenuItem
        Caption = 'Fornecedores'
      end
      object Produtos1: TMenuItem
        Caption = 'Produtos'
      end
    end
    object Estoque1: TMenuItem
      Caption = 'Estoque'
      object EntradanoEstoque1: TMenuItem
        Caption = 'Entrada no Estoque'
      end
      object SadanoEstoque1: TMenuItem
        Caption = 'Sa'#237'da no Estoque'
      end
    end
    object Financeiro1: TMenuItem
      Caption = 'Financeiro'
      object ContasaPagar1: TMenuItem
        Caption = 'Contas a Pagar'
      end
      object ContasaReceber1: TMenuItem
        Caption = 'Contas a Receber'
      end
    end
    object Sair1: TMenuItem
      Caption = 'Sair'
      OnClick = Sair1Click
    end
  end
end
