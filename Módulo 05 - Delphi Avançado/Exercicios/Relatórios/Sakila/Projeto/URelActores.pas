unit URelActores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelAtores = class(TForm)
    GroupBox1: TGroupBox;
    edtNome: TEdit;
    Label1: TLabel;
    btnVisualizar: TButton;
    qryActor: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxReport1: TfrxReport;
    btnExportar: TButton;
    frxPDFExport1: TfrxPDFExport;
    procedure btnVisualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnExportarClick(Sender: TObject);
  private
    procedure PrepararFiltro;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelAtores: TfrmRelAtores;

implementation

{$R *.dfm}

uses UdmSakila;

procedure TfrmRelAtores.btnExportarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxPDFExport1.FileName := 'Atores.pdf';
  frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelAtores.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelAtores.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmRelAtores := nil;
end;

procedure TfrmRelAtores.PrepararFiltro;
begin
  qryActor.Close;
  qryActor.ParamByName('LAST_NAME').AsString := '';
  if Trim(edtNome.Text) <> EmptyStr then
    qryActor.ParamByName('LAST_NAME').AsString := '%' + Trim(edtNome.Text) + '%';
  qryActor.Open;
  frxReport1.PrepareReport;
end;

end.
