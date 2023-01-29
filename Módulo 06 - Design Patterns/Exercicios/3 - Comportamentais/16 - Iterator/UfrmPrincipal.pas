unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    ListBox1: TListBox;
    btnCarregarCSV: TButton;
    btnCarregarXML: TButton;
    procedure btnCarregarCSVClick(Sender: TObject);
    procedure btnCarregarXMLClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UInterface_Aggregate, UInterface_Iterator, UConcrete_AggregateCSV,
  UCliente, UConcrete_AggregateXML;

procedure TfrmPrincipal.btnCarregarCSVClick(Sender: TObject);
var
  xAggregate: IAggregate;
  xIterator: IIterator;
begin
  //Cria o Concrete Aggregate, informando o caminho do arquivo CSV
  xAggregate := TConcreteAggregateCSV.Create('C:\Dados\Clientes.csv');

  //Obtém a instancia do Iterator
  xIterator := xAggregate.GetIterator;

  //Utiliza os métodos de navegação
  xIterator.PrimeiroObjeto;
  while not xIterator.FimLista do
  begin
    xIterator.ProximoObjeto;
    ListBox1.Items.Add((xIterator.ObjetoAtual as TCliente).Nome);
  end;
end;

procedure TfrmPrincipal.btnCarregarXMLClick(Sender: TObject);
var
  xAggregate: IAggregate;
  xIterator: IIterator;
begin
  //Cria o Concrete Aggregate, informando o caminho do arquivo XML
  xAggregate := TConcreteAggregateXML.Create('C:\Dados\Clientes.xml');

  //Obtém a instancia do Iterator
  xIterator := xAggregate.GetIterator;

  //Utiliza os métodos de navegação
  xIterator.PrimeiroObjeto;
  while not xIterator.FimLista do
  begin
    xIterator.ProximoObjeto;
    ListBox1.Items.Add((xIterator.ObjetoAtual as TCliente).Nome);
  end;
end;

end.
