unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    DBGrid1: TDBGrid;
    Panel1: TPanel;
    btnGerar: TButton;
    DataSource1: TDataSource;
    ClientDataSet1: TClientDataSet;
    procedure btnGerarClick(Sender: TObject);
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

uses UDirector, UBuilder, UProduct, UConcreteBuilder;

procedure TfrmPrincipal.btnGerarClick(Sender: TObject);
var
  xDirector: TDirector;
  xConcreteBuilder: IBuilder;
  xProduct: TProduct;
begin
  //Cria uma instancia do Director
  xDirector := TDirector.Create;

  //Cria uma instancia do Concrete Builder, informando os dados como parametro
  xConcreteBuilder := TConcreteBuilder.Create(ClientDataSet1.Data);
  try
    //Solicita a construção do objeto (relatório) ao Director
    xDirector.Construct(xConcreteBuilder);

    //Recebe o produto pronto (construido)
    xProduct := xConcreteBuilder.GetRelatorio;

    //Chama o método para salvar o arquivo em disco
    xProduct.SalvarArquivo;
  finally
    FreeAndNil(xDirector);
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
