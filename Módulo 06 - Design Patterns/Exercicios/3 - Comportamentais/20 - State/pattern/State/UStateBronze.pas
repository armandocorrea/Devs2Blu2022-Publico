unit UStateBronze;

interface

uses UConcrete_State, UEnumerated;

type
  TStateBronze = class(TStateBase)
    protected
      function ObterValorDesconto: Real; override;
      function ObterValorFrete: Real; override;
      function ObterCategoriaPedido: TCategoriaPedido; override;
  end;

implementation

{ TStateBronze }

function TStateBronze.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := cpBronze;
end;

function TStateBronze.ObterValorDesconto: Real;
begin
  Result := 0;

  //Se o valor do pedido for menor que 200,00, não há desconto
  if FTotalPedido <= 200 then
    Exit;

  //Caso contrário, aplica um desconto de 5%
  Result := FTotalPedido * 0.05;
end;

function TStateBronze.ObterValorFrete: Real;
begin
  //Aplica uma porcentagem de 6% para o frete
  Result := FTotalPedido * 0.06;
end;

end.
