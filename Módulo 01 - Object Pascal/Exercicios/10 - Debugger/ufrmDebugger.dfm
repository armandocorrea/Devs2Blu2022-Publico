object frmDebugger: TfrmDebugger
  Left = 0
  Top = 0
  Caption = 'Explorando o Debugger'
  ClientHeight = 197
  ClientWidth = 407
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
    Left = 48
    Top = 8
    Width = 321
    Height = 23
    Caption = 'Explorando o Debugger do Delphi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -19
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnProcessar: TButton
    Left = 109
    Top = 161
    Width = 193
    Height = 25
    Caption = 'Processar'
    TabOrder = 0
    OnClick = btnProcessarClick
  end
  object mmAtalhos: TMemo
    Left = 16
    Top = 37
    Width = 185
    Height = 113
    Lines.Strings = (
      'F7 - Debug - Trace Into'
      'Ctrl + F7 - Evaluate/Modify'
      'F8 - Debug - Step Over'
      'F9 - Run'
      'Ctrl + F9 - Compile Project'
      'F11 - Object Inspector'
      'F12 - Toggle Form/Unit'
      'Ctrl + F12 - Search Units'
      'Shift + F12 - Search Forms')
    TabOrder = 1
  end
  object mmAtalhos2: TMemo
    Left = 207
    Top = 37
    Width = 185
    Height = 113
    Lines.Strings = (
      'BreakPoints - Ctrl + Alt + B'
      'Call Stack - Ctrl + Alt + S'
      'Watches - Ctrl + Alt + W'
      'Threads - Ctrl + Alt + T')
    TabOrder = 2
  end
end
