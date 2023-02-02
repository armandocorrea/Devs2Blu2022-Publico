{ Invokable implementation File for TCalculadora which implements ICalculadora }

unit CalculadoraImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, CalculadoraIntf;

type

  { TCalculadora }
  TCalculadora = class(TInvokableClass, ICalculadora)
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
  if (aValor1 = 0) and (aValor2 = 0) then
    raise Exception.Create('Resultado indefinido!');

  if aValor2 = 0 then
    raise Exception.Create('Não é permitido realizar divisão por Zero!');

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

initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(TCalculadora);
end.

