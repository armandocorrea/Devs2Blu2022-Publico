unit UfrmRelUnidadeMedida;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelUnidadeMedida = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    btnVisualizar: TButton;
    btnExportar: TButton;
    frxReport1: TfrxReport;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    FDQuery1ID: TFDAutoIncField;
    FDQuery1DESCRICAO: TStringField;
    frxPDFExport1: TfrxPDFExport;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure PrepararFiltro;
  public
    { Public declarations }
  end;

var
  frmRelUnidadeMedida: TfrmRelUnidadeMedida;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmRelUnidadeMedida.btnExportarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxPDFExport1.Filename := 'C:\Users\kikob\Desktop\Furb\Aulas\Módulo 05 - Delphi Avançado\Exercicios\Relatórios\PedidoCompra\Relatorios\temp\UnidadeMedida.pdf';
  frxReport1.PrepareReport;
  frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelUnidadeMedida.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelUnidadeMedida.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FDQuery1.Close;

  frmRelUnidadeMedida := nil;
end;

procedure TfrmRelUnidadeMedida.PrepararFiltro;
begin
  FDQuery1.Close;
  FDQuery1.ParamByName('DESCRICAO').AsString := '';
  if Trim(edtDescricao.Text) <> EmptyStr then
    FDQuery1.ParamByName('DESCRICAO').AsString := '%' + Trim(edtDescricao.Text) + '%';
  FDQuery1.Open;
end;

end.
