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

 TListaCliente = array of TRegCliente;

var
  xContinuar: Integer;
  xCliente: TRegCliente;
  xListaCliente: TListaCliente;

  procedure AddCliente(const aRegCliente: TRegCliente);
  begin
    SetLength(xListaCliente, Length(xListaCliente)+1);
    xListaCliente[Length(xListaCliente)-1] := aRegCliente;
  end;

  procedure ListarClientes;
  var
    I: Integer;
    xRegCliente: TRegCliente;
  begin
    writeln('Listando...');

    for I := 0 to Length(xListaCliente)-1 do
    begin
      xRegCliente := xListaCliente[I];

      writeln('Código: ' + xRegCliente.Codigo.ToString);
      writeln('Nome..: ' + xRegCliente.Nome);
      writeln('Idade.: ' + xRegCliente.Idade.ToString);
    end;
  end;

begin
  try
    repeat
      writeln('Entre com o Código do Cliente: ');
      Readln(xCliente.Codigo);

      writeln('Entre com o Nome do Cliente: ');
      Readln(xCliente.Nome);

      writeln('Entre com a Idade Cliente: ');
      Readln(xCliente.Idade);

      AddCliente(xCliente);

      writeln('Deseja cadastrar mais clientes (1-Sim / 2-Não)');
      Readln(xContinuar);
    until (xContinuar = 2);

    ListarClientes;

    readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
