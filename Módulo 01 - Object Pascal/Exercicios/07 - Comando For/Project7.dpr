program Project7;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  xQtdeEntrada: Integer;
  xNumero: Integer;
  I: Integer;
  xSoma: Integer;
begin
  try
    xSoma := 0;

    //Imprimir a soma da quantidade de número de entrada
    WriteLn('Entre com a quantidade total de números:');
    Readln(xQtdeEntrada);

    for I := 0 to xQtdeEntrada-1 do
    begin
      WriteLn('Entre com o ' + IntToStr(I+1) + 'º número: ');
      Readln(xNumero);

      xSoma := xSoma + xNumero;
    end;

    WriteLn('A soma dos números é: ' + IntToStr(xSoma));
    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
