program OOP;

uses
  Forms,
  UPrincipal in 'UPrincipal.pas' {Form1},
  UAnimais in 'UAnimais.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
