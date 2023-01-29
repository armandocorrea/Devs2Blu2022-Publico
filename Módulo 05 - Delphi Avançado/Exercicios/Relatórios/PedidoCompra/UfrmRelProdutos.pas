unit UfrmRelProdutos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelProdutos = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtDescricao: TEdit;
    btnVisualizar: TButton;
    btnExportar: TButton;
    frxReport1: TfrxReport;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    Label2: TLabel;
    edtUnMedida: TEdit;
    FDQuery1ID: TFDAutoIncField;
    FDQuery1DESCRICAO: TStringField;
    FDQuery1UNDMEDIDA: TStringField;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
  private
    { Private declarations }
    procedure PrepararFiltro;
  public
    { Public declarations }
  end;

var
  frmRelProdutos: TfrmRelProdutos;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmRelProdutos.btnExportarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxPDFExport1.Filename := 'C:\Users\kikob\Desktop\Furb\Aulas\Módulo 05 - Delphi Avançado\Exercicios\Relatórios\PedidoCompra\Relatorios\temp\Produtos.pdf';
  frxReport1.PrepareReport;
  frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelProdutos.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelProdutos.PrepararFiltro;
begin
  FDQuery1.Close;
  FDQuery1.ParamByName('DESCRICAO').AsString := '';
  FDQuery1.ParamByName('UNDMEDIDA').AsString := '';

  if Trim(edtDescricao.Text) <> EmptyStr then
    FDQuery1.ParamByName('DESCRICAO').AsString := '%' + Trim(edtDescricao.Text) + '%';

  if Trim(edtUnMedida.Text) <> EmptyStr then
    FDQuery1.ParamByName('UNDMEDIDA').AsString := '%' + Trim(edtUnMedida.Text) + '%';

  FDQuery1.Open;
end;

end.
