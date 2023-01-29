program Aluno;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UAluno in 'UAluno.pas',
  UDisciplina in 'UDisciplina.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
