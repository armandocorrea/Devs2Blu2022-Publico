program Project3;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  xEntrada: String;
  xMeuNome: String;
  xMinhaIdade: Byte;
  xCasado: Boolean;
  xCotacaoDolar: Currency;

begin
  try
    xMeuNome      := 'Armando';
    xMinhaIdade   := 18;
    xCasado       := True;
    xCotacaoDolar := 5.50;

    Writeln ('Meu nome é: ' + xMeuNome);
    Writeln ('Minha idade é: ' + IntToStr(xMinhaIdade));
    Writeln ('Sou casado: ' + BoolToStr(xCasado));
    Writeln ('Cotação do Dólar: ' + FloatToStr(xCotacaoDolar));

    Readln(xEntrada);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
