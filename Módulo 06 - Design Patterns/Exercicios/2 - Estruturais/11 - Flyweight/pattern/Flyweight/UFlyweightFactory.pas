unit UFlyweightFactory;

interface

uses
  System.Classes, UConcreteFlyweight;

type
  TFlyweightFactory = class
  private
    // variável para armazenar os objetos compartilhados
    FListaCartoes: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    // método principal do Flyweight,
    // responsável por encontrar e retornar o objeto já criado
    // ou criá-lo caso não exista, adicionando-o na lista de objetos compartilhados
    function GetCartao(const aPais: string): TCartao;
  end;

implementation

uses
  System.SysUtils;

{ TFlyweightFactory }

constructor TFlyweightFactory.Create;
begin
  FListaCartoes := TStringList.Create;
end;

destructor TFlyweightFactory.Destroy;
var
  xContador: Integer;
begin
  // libera os objetos compartilhados
  for xContador := 0 to Pred(FListaCartoes.Count) do
    FListaCartoes.Objects[xContador].Free;

  // libera a lista de objetos
  FreeAndNil(FListaCartoes);;
  inherited;
end;

function TFlyweightFactory.GetCartao(const aPais: string): TCartao;
var
  xIndice: integer;
begin
  Result := nil;

  // tenta encontrar o objeto compartilhado através do nome do país
  if FListaCartoes.Find(aPais, xIndice) then
  begin
    // caso seja encontrado, o objeto compartilhado é retornado
    Result := (FListaCartoes.Objects[xIndice]) as TCartao;
    Exit;
  end;

  // caso não seja encontrado, é criado
  // obs: aqui podemos utilizar um Factory Method
  if aPais = 'Espanha' then
    Result := TCartaoEspanha.Create
  else if aPais = 'EUA' then
    Result := TCartaoEUA.Create
  else if aPais = 'Brasil' then
    Result := TCartaoBrasil.Create;

  // ... e depois adicionado na lista de objetos compartilhados
  // para que não precise ser criado novamente nas próximas iterações
  if Assigned(Result) then
    FListaCartoes.AddObject(aPais, Result);
end;

end.
