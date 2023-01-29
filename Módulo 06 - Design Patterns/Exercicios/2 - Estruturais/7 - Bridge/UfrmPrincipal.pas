unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnExportarExcel: TButton;
    btnExportarHTML: TButton;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportarExcelClick(Sender: TObject);
    procedure btnExportarHTMLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UAbstraction, URefinedAbstractionClientes, UConcreteImplementorHTML,
  UConcreteImplementorXLS;

procedure TfrmPrincipal.btnExportarExcelClick(Sender: TObject);
var
  xExportador: IExportador;
begin
  xExportador := TExportadorClientes.Create(TFormatoXLS.Create);
  try
    xExportador.ExportarDados(ClientDataSet1.Data);
  finally
    xExportador := nil;
  end;
end;

procedure TfrmPrincipal.btnExportarHTMLClick(Sender: TObject);
var
  xExportador: IExportador;
begin
  xExportador := TExportadorClientes.Create(TFormatoHTML.Create);
  try
    xExportador.ExportarDados(ClientDataSet1.Data);
  finally
    xExportador := nil;
  end;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ClientDataSet1.Close;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  ClientDataSet1.Open;
end;

end.
