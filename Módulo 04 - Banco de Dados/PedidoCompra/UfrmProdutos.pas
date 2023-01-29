unit UfrmProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdmPedidos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmProdutos = class(TForm)
    DataSource: TDataSource;
    FDTable: TFDTable;
    FDTableId: TFDAutoIncField;
    FDTableDescricao: TStringField;
    FDTableidUnidadeMedida: TLongWordField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    FDTableLoockupUnidadeMedida: TStringField;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    FDTableLookup: TFDTable;
    FDTableLookupId: TFDAutoIncField;
    FDTableLookupDescricao: TStringField;
    DataSource1: TDataSource;
    FDTableLookupUnidadeMedida: TStringField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProdutos: TfrmProdutos;

implementation

{$R *.dfm}

procedure TfrmProdutos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  FDTable.Close;
  FDTableLookup.Close;

  frmProdutos := nil;
end;

procedure TfrmProdutos.FormCreate(Sender: TObject);
begin
  FDTable.Open;
  FDTableLookup.Open;
end;

end.
