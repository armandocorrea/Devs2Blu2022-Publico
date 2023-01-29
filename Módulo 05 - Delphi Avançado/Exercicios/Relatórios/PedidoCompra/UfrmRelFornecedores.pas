unit UfrmRelFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxExportBaseDialog, frxExportPDF;

type
  TfrmRelFornecedores = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNome: TEdit;
    btnVisualizar: TButton;
    btnExportar: TButton;
    frxReport1: TfrxReport;
    FDQuery1: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    FDQuery1ID: TFDAutoIncField;
    FDQuery1NOME: TStringField;
    FDQuery1CNPJ: TStringField;
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
  frmRelFornecedores: TfrmRelFornecedores;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmRelFornecedores.btnExportarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxPDFExport1.Filename := 'C:\Users\kikob\Desktop\Furb\Aulas\Módulo 05 - Delphi Avançado\Exercicios\Relatórios\PedidoCompra\Relatorios\temp\Fornecedores.pdf';
  frxReport1.PrepareReport;
  frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelFornecedores.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelFornecedores.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  FDQuery1.Close;

  frmRelFornecedores := nil;
end;

procedure TfrmRelFornecedores.PrepararFiltro;
begin
  FDQuery1.Close;
  FDQuery1.ParamByName('NOME').AsString := '';
  if Trim(edtNome.Text) <> EmptyStr then
    FDQuery1.ParamByName('NOME').AsString := '%' + Trim(edtNome.Text) + '%';
  FDQuery1.Open;
end;

end.
