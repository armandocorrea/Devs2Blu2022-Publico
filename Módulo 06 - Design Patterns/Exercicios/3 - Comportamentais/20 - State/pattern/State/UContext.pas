unit UContext;

interface

uses UInterface_State, UEnumerated;

type
  TContextState = class
    private
      //Mantém uma referencia ao estado atual do objeto
      FState: IState;

      //Método principal do padrão do projeto
      procedure AlterarEstado;
    public
      constructor Create;

      procedure AdicionarItem(const aValorItem: Real);
      procedure RemoverItem(const aValorItem: Real);

      function ObterTotalPedido: Real;
      function ObterValorDesconto: Real;
      function ObterValorFrete: Real;
      function ObterCategoriaPedido: TCategoriaPedido;
  end;

implementation

{ TContext }

uses UStateBronze, UStateOuro, UStatePrata;

procedure TContextState.AdicionarItem(const aValorItem: Real);
begin
  FState.AdicionarItem(aValorItem);
  Self.AlterarEstado;
end;

procedure TContextState.AlterarEstado;
var
  xTotalPedido: Real;
begin
  xTotalPedido := FState.ObterTotalPedido;

  // Se o total do pedido for até 500,00, devolve uma instância do estado "Bronze"
  if (xTotalPedido <= 500) then
  begin
    FState := TStateBronze.Create(xTotalPedido);
    Exit;
  end;

  // Se o total do pedido for até 1.000,00, devolve uma instância do estado "Prata"
  if (xTotalPedido <= 1000) then
  begin
    FState := TStatePrata.Create(xTotalPedido);
    Exit;
  end;

  // Acima de 1.000,00, devolve uma instância do estado "Ouro"
  FState := TStateOuro.Create(xTotalPedido);
end;

constructor TContextState.Create;
begin
  //Inicia o pedido com o estado "Bronze", pois não há itens adicionado
  FState := TStateBronze.Create(0);
end;

function TContextState.ObterValorDesconto: Real;
begin
  Result := FState.ObterValorDesconto;
end;

function TContextState.ObterTotalPedido: Real;
begin
  Result := FState.ObterTotalPedido;
end;

function TContextState.ObterValorFrete: Real;
begin
  Result := FState.ObterValorFrete;
end;

procedure TContextState.RemoverItem(const aValorItem: Real);
begin
  FState.RemoverItem(aValorItem);
  Self.AlterarEstado;
end;

function TContextState.ObterCategoriaPedido: TCategoriaPedido;
begin
  // Obtém a categoria do pedido, acessando o estado atual
  Result := FState.ObterCategoriaPedido;
end;

end.
