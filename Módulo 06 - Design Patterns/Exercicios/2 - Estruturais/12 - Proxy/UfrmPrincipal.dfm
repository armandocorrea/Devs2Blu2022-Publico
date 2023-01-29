object frmProxy: TfrmProxy
  Left = 0
  Top = 0
  Caption = 'Proxy'
  ClientHeight = 123
  ClientWidth = 331
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
    Top = 32
    Width = 38
    Height = 13
    Caption = 'Origem:'
  end
  object Label2: TLabel
    Left = 22
    Top = 59
    Width = 40
    Height = 13
    Caption = 'Destino:'
  end
  object Label3: TLabel
    Left = 20
    Top = 86
    Width = 42
    Height = 13
    Caption = 'Key API:'
  end
  object edtOrigemCidade: TEdit
    Left = 68
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 0
    Text = 'Blumenau'
  end
  object edtOrigemEstado: TEdit
    Left = 195
    Top = 29
    Width = 121
    Height = 21
    TabOrder = 1
    Text = 'SC'
  end
  object edtDestinoCidade: TEdit
    Left = 68
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 2
    Text = 'Ara'#231'atuba'
  end
  object edtDestinoEstado: TEdit
    Left = 195
    Top = 56
    Width = 121
    Height = 21
    TabOrder = 3
    Text = 'SP'
  end
  object btnCalcular: TButton
    Left = 195
    Top = 83
    Width = 121
    Height = 25
    Caption = 'Calcular Distancia'
    TabOrder = 4
    OnClick = btnCalcularClick
  end
  object edtKeyAPI: TEdit
    Left = 68
    Top = 83
    Width = 121
    Height = 21
    TabOrder = 5
  end
end
