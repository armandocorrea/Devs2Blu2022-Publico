program Project9;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  xCelsius: Integer;
  xFahrenheit: Double;
  xResp: String;
begin
  try
    repeat
      Writeln('Digite a temperatura em Celsius: ');
      Readln(xCelsius);

      xFahrenheit := 9 * xCelsius / 5 + 32;

      Writeln('Equivalente em Fahrenheit: ' + FloatToStr(xFahrenheit));

      Writeln('Deseja repetir (s/n)? ');
      Readln(xResp);

    until (xResp = 'n');
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
