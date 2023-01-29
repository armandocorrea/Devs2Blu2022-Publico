unit UCalculatorServiceDefault;

interface

uses
  UIntCalculatorService;

type
  TCalculatorServiceDefault = class(TInterfacedObject, ICalculatorService)
  public
    function Sum(const aNum1, aNum2: Double): Double;
    function Subtract(const aNum1, aNum2: Double): Double;
    function Multiply(const aNum1, aNum2: Double): Double;
    function Divide(const aNum1, aNum2: Double): Double;
  end;

implementation

uses
  SysUtils;

{ TCalculatorServiceDefault }

function TCalculatorServiceDefault.Divide(const aNum1, aNum2: Double): Double;
begin
  if aNum2 = 0 then
    raise Exception.Create('Não é possível realizar divisão por zero');

  Result := aNum1 / aNum2;
end;

function TCalculatorServiceDefault.Multiply(const aNum1, aNum2: Double): Double;
begin
  Result := aNum1 * aNum2;
end;

function TCalculatorServiceDefault.Subtract(const aNum1, aNum2: Double): Double;
begin
  Result := aNum1 - aNum2;
end;

function TCalculatorServiceDefault.Sum(const aNum1, aNum2: Double): Double;
begin
  Result := aNum1 + aNum2;
end;

end.
