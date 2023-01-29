unit UfrmUnidadeMedida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UdmPedidos, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask,
  Vcl.DBCtrls, Vcl.ExtCtrls, Vcl.Grids, Vcl.DBGrids;

type
  TfrmUnidadeMedida = class(TForm)
    DataSource: TDataSource;
    FDTable: TFDTable;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    FDTableId: TFDAutoIncField;
    FDTableDescricao: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmUnidadeMedida: TfrmUnidadeMedida;

implementation

{$R *.dfm}

procedure TfrmUnidadeMedida.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  FDTable.Close;

  frmUnidadeMedida := nil;
end;

procedure TfrmUnidadeMedida.FormCreate(Sender: TObject);
begin
  FDTable.Open;
end;

end.
