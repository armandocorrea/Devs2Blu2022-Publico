program Debugger;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;

var
  x,y: Integer;
begin
  try
    x := 5;
    y := 0;

    while (x > 2) do
    begin
      writeln(x);

      y := y + x;
      x := x - 1;
    end;

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
