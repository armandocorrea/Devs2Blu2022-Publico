unit UStatePrata;

interface

uses UConcrete_State, UEnumerated;

type
  TStatePrata = class(TStateBase)
    protected
      function ObterValorDesconto: Real; override;
      function ObterValorFrete: Real; override;
      function ObterCategoriaPedido: TCategoriaPedido; override;
  end;

implementation

{ TStateBronze }

function TStatePrata.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := cpPrata;
end;

function TStatePrata.ObterValorDesconto: Real;
begin
  //Aplica 7% de desconto
  Result := FTotalPedido * 0.07;

  //Se o valor do pedido for menor que 700,00, aplica mais 2% de desconto
  if FTotalPedido > 700 then
    Result := Result * 0.02;
end;

function TStatePrata.ObterValorFrete: Real;
begin
  //Aplica uma porcentagem de 5% para o frete
  Result := FTotalPedido * 0.05;
end;

end.
