unit UComposite;

interface

uses
  UComponent_Operation,
  ULeaf,
  Generics.Collections;

type
  TPacoteViagem = class(TInterfacedObject, IViagem)
    private
      //Lista de objetos para armazenar as viagens (Leaf) do pacote
      FViagens: TObjectList<TViagem>;
    public
      constructor Create;
      destructor Destroy; override;

      //Operation
      function CalcularValor: Double;
      procedure AdicionarViagem(aViagem: TViagem);
  end;


implementation

uses
  System.SysUtils;

{ TPacoteViagem }

procedure TPacoteViagem.AdicionarViagem(aViagem: TViagem);
begin
  FViagens.Add(aViagem);
end;

function TPacoteViagem.CalcularValor: Double;
var
  xViagem: TViagem;
begin
  // Este é o método principal (Operation) que dá propósito ao padrão Composite.
  // O método irá ler cada uma das viagens dentro do pacote,
  // ou seja, cada Leaf dentro do Composite,
  // para calcular o valor de cada viagem, e por fim, obter o valor total do pacote

  Result := 0;
  for xViagem in FViagens do
  begin
    //Chama o Operation do Leaf
    Result := Result + xViagem.CalcularValor;
  end;
end;

constructor TPacoteViagem.Create;
begin
  FViagens := TObjectList<TViagem>.Create;
end;

destructor TPacoteViagem.Destroy;
begin
  FViagens.Clear;
  FreeAndNil(FViagens);
  inherited;
end;

end.
