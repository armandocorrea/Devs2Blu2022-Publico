unit UIntCalculatorService;

interface

type
  ICalculatorService = interface
    ['{2FCF29F8-59BF-41E5-AA26-ABDE1D634A20}']

    function Sum(const aNum1, aNum2: Double): Double;
    function Subtract(const aNum1, aNum2: Double): Double;
    function Multiply(const aNum1, aNum2: Double): Double;
    function Divide(const aNum1, aNum2: Double): Double;
  end;

implementation

end.
