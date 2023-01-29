unit UfrmPedidos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.DBCtrls,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, Vcl.Grids, Vcl.DBGrids;

type
  TfrmPedidos = class(TForm)
    DBNavigator1: TDBNavigator;
    PedidoCompra: TFDTable;
    PedidoCompraId: TFDAutoIncField;
    PedidoCompraNumero: TLongWordField;
    PedidoCompraDataPedido: TDateField;
    PedidoCompraidComprador: TLongWordField;
    PedidoCompraidFornecedor: TLongWordField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    dtsPedidoCompra: TDataSource;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    dtsLookupComprador: TDataSource;
    LookupComprador: TFDTable;
    dtsLookupFornecedor: TDataSource;
    LookupFornecedor: TFDTable;
    LookupCompradorId: TFDAutoIncField;
    LookupCompradorNome: TStringField;
    LookupCompradorCargo: TStringField;
    LookupFornecedorId: TFDAutoIncField;
    LookupFornecedorCNPJ: TStringField;
    LookupFornecedorNome: TStringField;
    DBGrid1: TDBGrid;
    Label6: TLabel;
    DBNavigator2: TDBNavigator;
    dtsItemCompra: TDataSource;
    ItemCompra: TFDTable;
    ItemCompraId: TFDAutoIncField;
    ItemCompraQuantidade: TFloatField;
    ItemCompraidPedidoCompra: TLongWordField;
    ItemCompraidProduto: TLongWordField;
    LookupProdutos: TFDTable;
    LookupProdutosId: TFDAutoIncField;
    LookupProdutosDescricao: TStringField;
    LookupProdutosidUnidadeMedida: TLongWordField;
    ItemCompraLookupProduto: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ItemCompraBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPedidos: TfrmPedidos;

implementation

{$R *.dfm}

uses UdmPedidos;

procedure TfrmPedidos.ItemCompraBeforePost(DataSet: TDataSet);
begin
  ItemCompraidPedidoCompra.AsInteger :=
    PedidoCompraId.AsInteger;
end;

procedure TfrmPedidos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  PedidoCompra.Close;
  ItemCompra.Close;
  LookupComprador.Close;
  LookupFornecedor.Close;
  LookupProdutos.Close;

  frmPedidos := nil;
end;

procedure TfrmPedidos.FormCreate(Sender: TObject);
begin
  PedidoCompra.Open;
  ItemCompra.Open;
  LookupComprador.Open;
  LookupFornecedor.Open;
  LookupProdutos.Open;
end;

end.
