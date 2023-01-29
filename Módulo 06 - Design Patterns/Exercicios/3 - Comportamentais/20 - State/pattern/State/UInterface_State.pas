unit UInterface_State;

interface

uses UEnumerated;

type
  IState = interface
    procedure AdicionarItem(const aValorItem: Real);
    procedure RemoverItem(const aValorItem: Real);

    function ObterTotalPedido: Real;
    function ObterValorDesconto: Real;
    function ObterValorFrete: Real;
    function ObterCategoriaPedido: TCategoriaPedido;
  end;

implementation

end.
