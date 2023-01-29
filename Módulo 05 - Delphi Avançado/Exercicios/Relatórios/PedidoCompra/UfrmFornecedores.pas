unit UfrmFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdmPedidos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmFornecedores = class(TForm)
    DataSource: TDataSource;
    FDTable: TFDTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    FDTableId: TFDAutoIncField;
    FDTableCNPJ: TStringField;
    FDTableNome: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFornecedores: TfrmFornecedores;

implementation

{$R *.dfm}

procedure TfrmFornecedores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FDTable.Close;

  frmFornecedores := nil;
end;

procedure TfrmFornecedores.FormCreate(Sender: TObject);
begin
  FDTable.Open;
end;

end.
