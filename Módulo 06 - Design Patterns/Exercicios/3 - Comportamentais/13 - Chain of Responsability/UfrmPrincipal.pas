unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    btnProcessar: TButton;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    OpenDialog1: TOpenDialog;
    ClientDataSet1Codigo: TIntegerField;
    ClientDataSet1Nome: TStringField;
    ClientDataSet1Cidade: TStringField;
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

uses
  UInterfaceHandler,
  UConcreteHandler_CSV,
  UConcreteHandler_JSON,
  UConcreteHandler_XML;

procedure TfrmPrincipal.btnProcessarClick(Sender: TObject);
var
  // Variáveis do tipo da Interface
  xParserCSV: IParser;
  xParserXML: IParser;
  xParserJSON: IParser;
begin
  // Abre o OpenDialog para seleção do arquivo
  if not OpenDialog1.Execute then
    Exit;

  // Cria os Parsers (Concrete Handlers)
  xParserCSV  := TParserCSV.Create;
  xParserXML  := TParserXML.Create;
  xParserJSON := TParserJSON.Create;

  // Configura a hierarquia horizontal dos Parsers
  xParserCSV.SetProximoParser(xParserXML);
  xParserXML.SetProximoParser(xParserJSON);
  xParserJSON.SetProximoParser(nil);

  // Limpa o DataSet
  ClientDataSet1.EmptyDataSet;

  // Inicia a cadeia pelo primeiro elo, ou seja, o mais provável ou comum
  xParserCSV.ProcessarInclusao(OpenDialog1.FileName, ClientDataSet1);

  ClientDataSet1.First;
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
