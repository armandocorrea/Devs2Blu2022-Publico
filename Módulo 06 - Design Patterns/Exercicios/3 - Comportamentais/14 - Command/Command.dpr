program Command;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UReceiver in 'pattern\UReceiver.pas',
  UCommand in 'pattern\UCommand.pas',
  UConcreteCommand in 'pattern\UConcreteCommand.pas',
  UInvoker in 'pattern\UInvoker.pas';

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
