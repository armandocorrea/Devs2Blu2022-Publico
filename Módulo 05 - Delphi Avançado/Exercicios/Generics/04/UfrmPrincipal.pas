unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TUtils = class
    class function IIF<T>(const aCondicao: Boolean; const aTipo1, aTipo2: T): T;
  end;

  TProduto = class
  private
    FDescricao: String;
    procedure SetDescricao(const Value: String);
  published
    constructor Create;
    property Descricao: String read FDescricao write SetDescricao;
  end;

  TForm6 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

{ TUtils }

class function TUtils.IIF<T>(const aCondicao: Boolean; const aTipo1,aTipo2: T): T;
begin
  if aCondicao then
    Result := aTipo1
  else
    Result := aTipo2;
end;

procedure TForm6.Button1Click(Sender: TObject);
var
  xAux: String;
begin
  {if Edit1.Text <> EmptyStr then
    xAux := Edit1.Text
  else
    xAux := 'Laranja';}

  xAux := TUtils.IIF<String>(Edit1.Text <> EmptyStr, Edit1.Text, 'Laranja');
  ShowMessage(xAux);
end;

{ TProduto }

constructor TProduto.Create;
begin
  FDescricao := 'Produto Genérico';
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TForm6.Button2Click(Sender: TObject);
var
  xProduto1,
  xProduto2,
  xProduto3: TProduto;
begin
  xProduto2 := nil;

  xProduto1 := TProduto.Create;
  xProduto1.Descricao := 'Laranja Pera';

  xProduto3 := TUtils.IIF<TProduto>(Assigned(xProduto1), xProduto1, TProduto.Create);

  ShowMessage(xProduto3.Descricao);
end;

end.
