program ExercicioFinal;

uses
  Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmCaixaGoDev},
  UCaixa in 'UCaixa.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmCaixaGoDev, frmCaixaGoDev);
  Application.Run;
end.
