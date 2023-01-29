program Project5;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

function MaiorIdade(const aIdade: Byte): Boolean;
begin
  if aIdade >= 18 then
    Result := True
  else
    Result := False;
end;

function Periodo(const aHora: Byte): String;
begin
  if aHora < 12 then
    Result := 'Bom dia'
  else if aHora < 18 then
    Result := 'Boa tarde'
  else
    Result := 'Boa noite';
end;

var
  xIdade: Byte;
  xHora: Byte;
  xStrPeriodo: String;
  xEntrada: String;
begin
  try
    writeln('Olá entre com sua idade:');
    Readln(xIdade);

    writeln('Entre com o horário:');
    Readln(xHora);

    xStrPeriodo := Periodo(xHora);

    if MaiorIdade(xIdade) then
      writeln(xStrPeriodo + ' você é maior de idade.')
    else
      writeln(xStrPeriodo + ' você não é maior de idade.');

    Readln(xEntrada);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
