unit URelCity;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF, Vcl.DBCtrls;

type
  TfrmRelCity = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    btnVisualizar: TButton;
    qryCity: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    btnExportar: TButton;
    frxPDFExport1: TfrxPDFExport;
    DBLookupCidade: TDBLookupComboBox;
    FDLKCidade: TFDTable;
    dtsLkCidade: TDataSource;
    dtsCidade: TDataSource;
    qryAddress: TFDQuery;
    frxDBDataset2: TfrxDBDataset;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure PrepararFiltro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelCity: TfrmRelCity;

implementation

{$R *.dfm}

uses UdmSakila;

procedure TfrmRelCity.btnExportarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxPDFExport1.FileName := 'Cidades.pdf';
  frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelCity.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelCity.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmRelCity := nil;
end;

procedure TfrmRelCity.FormCreate(Sender: TObject);
begin
  FDLKCidade.Open;
end;

procedure TfrmRelCity.PrepararFiltro;
begin
  qryCity.Close;
  qryCity.ParamByName('city_id').AsInteger := 0;
  if DBLookupCidade.Text <> EmptyStr then
    qryCity.ParamByName('city_id').AsInteger := FDLKCidade.FieldByName('city_id').AsInteger;
  qryCity.Open;

  qryAddress.Close;
  qryAddress.Open;

  frxReport1.PrepareReport;
end;

end.
