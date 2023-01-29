unit URelActoresFilmes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client, frxClass, frxDBSet,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelAtoresFilmes = class(TForm)
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
  frmRelAtoresFilmes: TfrmRelAtoresFilmes;

implementation

{$R *.dfm}

uses UdmSakila;

procedure TfrmRelAtoresFilmes.btnExportarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxPDFExport1.FileName := 'AtoresFilmes.pdf';
  frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelAtoresFilmes.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelAtoresFilmes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmRelAtoresFilmes := nil;
end;

procedure TfrmRelAtoresFilmes.PrepararFiltro;
begin
  qryActor.Close;
  qryActor.ParamByName('LAST_NAME').AsString := '';
  if Trim(edtNome.Text) <> EmptyStr then
    qryActor.ParamByName('LAST_NAME').AsString := '%' + Trim(edtNome.Text) + '%';
  qryActor.Open;
  frxReport1.PrepareReport;
end;

end.
