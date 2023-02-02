{ Invokable interface ICalculadora }

unit CalculadoraIntf;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns;

type
  { Invokable interfaces must derive from IInvokable }
  ICalculadora = interface(IInvokable)
  ['{347CF8C1-78DE-4449-9C9F-D33D771B20EB}']

    function Somar(const aValor1, aValor2: Double): Double;
    function Subtrair(const aValor1, aValor2: Double): Double;
    function Multiplicar(const aValor1, aValor2: Double): Double;
    function Dividir(const aValor1, aValor2: Double): Double;
  end;

implementation

initialization
  { Invokable interfaces must be registered }
  InvRegistry.RegisterInterface(TypeInfo(ICalculadora));

end.
