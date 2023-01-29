unit UCalculatorService;

interface

uses
  UIntCalculatorService;

type
  TTypeCalc = (tpSum, tpSub, tpMul, tpDiv);

  TCalculatorService = class
    private
      FNum1: Double;
      FNum2: Double;

      FCalculatorService: ICalculatorService;
    public
      constructor Create(const aNum1, aNum2: Double; aCalculatorService: ICalculatorService);

      function processCalc(aTypeCalc: TTypeCalc): Double;
  end;


implementation

{ TCalculatorService }

constructor TCalculatorService.Create(const aNum1, aNum2: Double; aCalculatorService: ICalculatorService);
begin
  FNum1 := aNum1;
  FNum2 := aNum2;

  FCalculatorService := aCalculatorService;
end;

function TCalculatorService.processCalc(aTypeCalc: TTypeCalc): Double;
begin
  case aTypeCalc of
    tpSum:
      Result := FCalculatorService.Sum(FNum1, FNum2);
    tpSub:
      Result := FCalculatorService.Subtract(FNum1, FNum2);
    tpMul:
      Result := FCalculatorService.Multiply(FNum1, FNum2);
    tpDiv:
      Result := FCalculatorService.Divide(FNum1, FNum2);
  end;
end;

end.
