unit UfrmRelPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  frxClass, frxDBSet, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  frxExportBaseDialog, frxExportPDF, Vcl.DBCtrls;

type
  TfrmRelPedidos = class(TForm)
    GroupBox1: TGroupBox;
    btnVisualizar: TButton;
    btnExportar: TButton;
    frxReport1: TfrxReport;
    QryPedido: TFDQuery;
    frxDBDataset1: TfrxDBDataset;
    frxPDFExport1: TfrxPDFExport;
    QryPedidoNUMERO: TLongWordField;
    QryPedidoDATAPEDIDO: TDateField;
    QryPedidoCOMPRADOR: TStringField;
    QryPedidoCARGO: TStringField;
    QryPedidoFORNECEDOR: TStringField;
    QryPedidoCNPJ: TStringField;
    QryItemCompra: TFDQuery;
    dtsItemCompra: TDataSource;
    QryPedidoID: TFDAutoIncField;
    QryItemCompraIDPRODUTO: TLongWordField;
    QryItemCompraPRODUTO: TStringField;
    QryItemCompraQUANTIDADE: TFloatField;
    frxDBDataset2: TfrxDBDataset;
    QryItemCompraIdPedidoCompra: TLongWordField;
    dtsLookupComprador: TDataSource;
    LookupComprador: TFDTable;
    LookupCompradorId: TFDAutoIncField;
    LookupCompradorNome: TStringField;
    LookupCompradorCargo: TStringField;
    DBLookupComprador: TDBLookupComboBox;
    Label4: TLabel;
    dtsLookupFornecedor: TDataSource;
    LookupFornecedor: TFDTable;
    LookupFornecedorId: TFDAutoIncField;
    LookupFornecedorCNPJ: TStringField;
    LookupFornecedorNome: TStringField;
    DBLookupFornecedor: TDBLookupComboBox;
    Label5: TLabel;
    procedure btnVisualizarClick(Sender: TObject);
    procedure btnExportarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure PrepararFiltro;
  public
    { Public declarations }
  end;

var
  frmRelPedidos: TfrmRelPedidos;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmRelPedidos.btnExportarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxPDFExport1.Filename := 'C:\Users\kikob\Desktop\Furb\Aulas\Módulo 05 - Delphi Avançado\Exercicios\Relatórios\PedidoCompra\Relatorios\temp\Pedidos.pdf';
  frxReport1.PrepareReport;
  frxReport1.Export(frxPDFExport1);
end;

procedure TfrmRelPedidos.btnVisualizarClick(Sender: TObject);
begin
  Self.PrepararFiltro;

  frxReport1.ShowReport;
end;

procedure TfrmRelPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  QryPedido.Close;
  QryItemCompra.Close;

  LookupComprador.Close;
  LookupFornecedor.Close;

  frmRelPedidos := nil;
end;

procedure TfrmRelPedidos.FormCreate(Sender: TObject);
begin
  LookupComprador.Open;
  LookupFornecedor.Open;
end;

procedure TfrmRelPedidos.PrepararFiltro;
begin
  QryPedido.Close;
  QryPedido.ParamByName('IDCOMPRADOR').AsInteger  := 0;
  QryPedido.ParamByName('IDFORNECEDOR').AsInteger := 0;

  if DBLookupComprador.Text <> EmptyStr then
    QryPedido.ParamByName('IDCOMPRADOR').AsInteger := LookupComprador.FieldByName('ID').AsInteger;

  if DBLookupFornecedor.Text <> EmptyStr then
    QryPedido.ParamByName('IDFORNECEDOR').AsInteger := LookupFornecedor.FieldByName('ID').AsInteger;

  QryPedido.Open;

  QryItemCompra.Close;
  QryItemCompra.Open;
end;

end.
