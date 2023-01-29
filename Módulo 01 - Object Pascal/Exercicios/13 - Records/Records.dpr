program Records;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

type
 TRegCliente = record
   Codigo: Integer;
   Nome: String;
   Idade: Byte;
 end;

var
  xCliente: TRegCliente;
begin
  try
    writeln('Entre com o Código do Cliente: ');
    Readln(xCliente.Codigo);

    writeln('Entre com o Nome do Cliente: ');
    Readln(xCliente.Nome);

    writeln('Entre com a Idade Cliente: ');
    Readln(xCliente.Idade);

    writeln('Código: ' + xCliente.Codigo.ToString);
    writeln('Nome..: ' + xCliente.Nome);
    writeln('Idade.: ' + xCliente.Idade.ToString);

    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
