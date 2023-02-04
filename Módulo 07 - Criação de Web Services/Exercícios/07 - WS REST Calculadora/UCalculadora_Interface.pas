unit UCalculadora_Interface;

interface

type
  ICalculadora = interface
    function Somar(const aValor1, aValor2: Double): Double;
    function Subtrair(const aValor1, aValor2: Double): Double;
    function Multiplicar(const aValor1, aValor2: Double): Double;
    function Dividir(const aValor1, aValor2: Double): Double;
  end;

implementation

end.
