unit USubSystem_CalculoLoja;

interface

type
  TSubsystemCalculoLoja = class
  private
    function AplicarDesconto(const aFidelidade: Integer; const aPreco: Real): Real;
    function AplicarMargemVenda(const aPreco: Real): Real;
  public
    function CalcularPrecoFinal(const aFidelidade: Integer; const aPreco: Real): Real;
  end;

implementation

{ TSubsystemCalculoLoja }

function TSubsystemCalculoLoja.AplicarDesconto(const aFidelidade: Integer;
  const aPreco: Real): Real;
begin
  // Aplica o desconto conforme a fidelidade do cliente
  Result := aPreco;
  case aFidelidade of
    0: Result := aPreco - (aPreco * 0.02); // Nenhuma - 2% de desconto
    1: Result := aPreco - (aPreco * 0.06); // Bronze - 6% de desconto
    2: Result := aPreco - (aPreco * 0.1);  // Prata - 10% de desconto
    3: Result := aPreco - (aPreco * 0.18); // Ouro - 18% de desconto
  end;
end;

function TSubsystemCalculoLoja.AplicarMargemVenda(const aPreco: Real): Real;
begin
  // Aplica a margem de venda de 35%
  Result := aPreco + (aPreco * 0.35);
end;

function TSubsystemCalculoLoja.CalcularPrecoFinal(const aFidelidade: Integer;
  const aPreco: Real): Real;
begin
  // Operação principal do SubSystem: aplica o desconto e a margem de venda
  Result := AplicarDesconto(aFidelidade, aPreco);
  Result := AplicarMargemVenda(Result);
end;

end.
