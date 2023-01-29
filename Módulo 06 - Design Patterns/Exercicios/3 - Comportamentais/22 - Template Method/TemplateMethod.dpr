program TemplateMethod;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UAbstractClass in 'pattern\TemplateMethod\UAbstractClass.pas',
  UConcreteClassRepositories in 'pattern\TemplateMethod\UConcreteClassRepositories.pas',
  UConcreteClassUsers in 'pattern\TemplateMethod\UConcreteClassUsers.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
