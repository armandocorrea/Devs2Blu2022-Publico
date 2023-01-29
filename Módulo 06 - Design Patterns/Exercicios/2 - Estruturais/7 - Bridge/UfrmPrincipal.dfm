object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Bridge'
  ClientHeight = 330
  ClientWidth = 599
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
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 599
    Height = 289
    Align = alClient
    DataSource = DataSource1
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object Panel1: TPanel
    Left = 0
    Top = 289
    Width = 599
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitLeft = 176
    ExplicitTop = 120
    ExplicitWidth = 185
    object btnExportarExcel: TButton
      Left = 24
      Top = 8
      Width = 75
      Height = 25
      Caption = 'Excel'
      TabOrder = 0
      OnClick = btnExportarExcelClick
    end
    object btnExportarHTML: TButton
      Left = 105
      Top = 8
      Width = 75
      Height = 25
      Caption = 'HTML'
      TabOrder = 1
      OnClick = btnExportarHTMLClick
    end
  end
  object ClientDataSet1: TClientDataSet
    PersistDataPacket.Data = {
      540100009619E0BD0100000018000000030008000000030000005D0006436F64
      69676F0400010010000000044E6F6D6501004900100001000557494454480200
      0200320006436964616465010049001000010005574944544802000200320000
      000000010000000F4672616E6B20556E646572776F6F640A57617368696E6774
      6F6E00000200000010416E6E616C697365204B656174696E670C5068696C6164
      656C706869610000030000000B457468616E204275726B6505426F6973650000
      040000000F436172726965204D61746869736F6E084E657720596F726B000005
      0000000C4861726F6C642046696E63680B4C6F7320416E67656C657300000600
      00000C57616C7465722057686974650B416C6275717565727175650000070000
      00104D69636861656C2053636F6669656C640953616E20446965676F00000800
      00000D5361756C20426572656E736F6E074368696361676F}
    Active = True
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 64
  end
  object DataSource1: TDataSource
    DataSet = ClientDataSet1
    Left = 120
    Top = 72
  end
end
