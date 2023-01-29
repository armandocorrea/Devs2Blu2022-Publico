unit UConcrete_State;

interface

uses UInterface_State, UEnumerated;

type
  TStateBase = class(TInterfacedObject, IState)
    protected
      FTotalPedido: Real;

      //Métodos protegidos que serão sobrescritos pelas classes herdadas
      function ObterValorDesconto: Real; virtual;
      function ObterValorFrete: Real; virtual;
      function ObterCategoriaPedido: TCategoriaPedido; virtual;
    public
      constructor Create(const aTotalPedido: Real);

      procedure AdicionarItem(const aValorItem: Real);
      procedure RemoverItem(const aValorItem: Real);
      function ObterTotalPedido: Real;
  end;

implementation

{ TStateBase }

procedure TStateBase.AdicionarItem(const aValorItem: Real);
begin
  FTotalPedido := FTotalPedido + aValorItem;
end;

constructor TStateBase.Create(const aTotalPedido: Real);
begin
  FTotalPedido := aTotalPedido;
end;

function TStateBase.ObterCategoriaPedido: TCategoriaPedido;
begin
  Result := cpBronze;
end;

function TStateBase.ObterTotalPedido: Real;
begin
  Result := FTotalPedido;
end;

function TStateBase.ObterValorDesconto: Real;
begin
  //Será implementado nas classes herdadas
  Result := 0;
end;

function TStateBase.ObterValorFrete: Real;
begin
  //Será implementado nas classes herdadas
  Result := 0;
end;

procedure TStateBase.RemoverItem(const aValorItem: Real);
begin
  FTotalPedido := FTotalPedido - aValorItem;
end;

end.
