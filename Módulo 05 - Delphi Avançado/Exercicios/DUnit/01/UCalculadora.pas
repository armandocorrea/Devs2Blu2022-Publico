unit UCalculadora;

interface

type
  TEnumOperacoes = (opSomar, opSubtrair, opMultiplicar, opDividir);

  TCalculadora = class
    private
    public
      function Somar(const aNumero1, aNumero2: Double): Double;
      function Subtrair(const aNumero1, aNumero2: Double): Double;
      function Multiplicar(const aNumero1, aNumero2: Double): Double;
      function Dividir(const aNumero1, aNumero2: Double): Double;
  end;

implementation

uses
  System.SysUtils;

{ TCalculadora }

function TCalculadora.Dividir(const aNumero1, aNumero2: Double): Double;
begin
  if aNumero2 = 0 then
    raise Exception.Create('Não é possível realizar divisão por zero!');

  Result := aNumero1 / aNumero2;
end;

function TCalculadora.Multiplicar(const aNumero1, aNumero2: Double): Double;
begin
  Result := aNumero1 * aNumero2;
end;

function TCalculadora.Somar(const aNumero1, aNumero2: Double): Double;
begin
  Result := aNumero1 + aNumero2;
end;

function TCalculadora.Subtrair(const aNumero1, aNumero2: Double): Double;
begin
  Result := aNumero1 - aNumero2;
end;

end.
