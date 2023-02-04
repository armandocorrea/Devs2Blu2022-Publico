unit UCalculadora_Impl;

interface

uses UCalculadora_Interface;

type
  TCalculadora = class(TInterfacedObject, ICalculadora)
    public
      function Somar(const aValor1, aValor2: Double): Double;
      function Subtrair(const aValor1, aValor2: Double): Double;
      function Multiplicar(const aValor1, aValor2: Double): Double;
      function Dividir(const aValor1, aValor2: Double): Double;
  end;

implementation

uses
  System.SysUtils;

{ TCalculadora }

function TCalculadora.Dividir(const aValor1, aValor2: Double): Double;
begin
  if aValor2 = 0 then
    raise Exception.Create('Não é possível dividir por Zero!');

  Result := aValor1 / aValor2;
end;

function TCalculadora.Multiplicar(const aValor1, aValor2: Double): Double;
begin
  Result := aValor1 * aValor2;
end;

function TCalculadora.Somar(const aValor1, aValor2: Double): Double;
begin
  Result := aValor1 + aValor2;
end;

function TCalculadora.Subtrair(const aValor1, aValor2: Double): Double;
begin
  Result := aValor1 - aValor2;
end;

end.
