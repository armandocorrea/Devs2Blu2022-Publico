unit UStateOuro;

interface

uses UConcrete_State, UEnumerated;

type
  TStateOuro = class(TStateBase)
    protected
      function ObterValorDesconto: Real; override;
      function ObterValorFrete: Real; override;
      function ObterCategoriaPedido: TCategoriaPedido; override;
  end;

implementation

{ TStateBronze }

function TStateOuro.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := cpOuro;
end;

function TStateOuro.ObterValorDesconto: Real;
begin
  //Aplica 8% de desconto
  Result := FTotalPedido * 0.08;

  //.. e mais um desconto de 10% (topzera)
  Result := Result * 0.01;
end;

function TStateOuro.ObterValorFrete: Real;
begin
  Result := 0;

  //Se o total do pedido for maior que 2 mil, o frete é grátis
  if FTotalPedido > 2000 then
    Exit;

  //Aplica uma porcentagem de 2% para o frete
  Result := FTotalPedido * 0.02;
end;

end.
