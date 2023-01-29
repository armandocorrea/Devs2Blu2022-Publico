unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  TPessoa = class
  private
    FNome: String;
    procedure SetNome(const Value: String);
  published
    property Nome: String read FNome write SetNome;
  end;

  //Construtor padrão
  //TNFe<T : class, constructor> = class
  TNFe<T : constructor> = class
    FGeneric : T;
    constructor Create;
    function GetGeneric: T;
  end;

  TForm6 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
  xNFe: TNFe<TPessoa>;
begin
  xNFe := TNFe<TPessoa>.Create;

  try
    xNFe.FGeneric.Nome := 'Armando Neto';
    ShowMessage(xNFe.FGeneric.Nome);
  finally
    FreeAndNil(xNFe);
  end;
end;

{ TPessoa }

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TNFe<T> }

constructor TNFe<T>.Create;
begin
  FGeneric := T.Create;
end;

function TNFe<T>.GetGeneric: T;
begin
  Result := FGeneric;
end;

end.
