unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    btnProcessar: TButton;
    ClientDataSet1: TClientDataSet;
    procedure btnProcessarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UFlyweightFactory, UConcreteFlyweight;

procedure TfrmPrincipal.btnProcessarClick(Sender: TObject);
var
  xFlyweightFactory: TFlyweightFactory;
  xCartao: TCartao;
  xFieldPais: TField;
  xFieldNome: TField;
begin
  // cria o objeto da classe Factory do Flyweight
  xFlyweightFactory := TFlyweightFactory.Create;
  try
    xFieldPais := ClientDataSet1.FindField('Pais');
    xFieldNome := ClientDataSet1.FindField('Nome');

    ClientDataSet1.First;
    // executa um loop em todos os registros
    while not ClientDataSet1.EOF do
    begin
      // chama o método GetCartao para retornar o objeto compartilhado
      // através do nome do país
      xCartao := xFlyweightFactory.GetCartao(xFieldPais.AsString);

      if Assigned(xCartao) then
      begin
        // altera a proprieade extrínseca, que é o nome do leitor
        xCartao.NomeLeitor := xFieldNome.AsString;

        // chama o método para exportação do cartão
        xCartao.Exportar;
      end;

      ClientDataSet1.Next;
    end;
  finally
    // libera o objeto da classe Factory do Flyweight
    FreeAndNil(xFlyweightFactory);
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
