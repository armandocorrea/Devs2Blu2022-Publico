program Mediator;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UInterface_Colleague in 'pattern\Mediator\UInterface_Colleague.pas',
  UInterface_Mediator in 'pattern\Mediator\UInterface_Mediator.pas',
  UConcrete_Mediator in 'pattern\Mediator\UConcrete_Mediator.pas',
  UConcrete_Colleague in 'pattern\Mediator\UConcrete_Colleague.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
