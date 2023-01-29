program Interpreter;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UContext in 'pattern\UContext.pas',
  UAbstractExpression in 'pattern\UAbstractExpression.pas',
  UTerminalExpression in 'pattern\UTerminalExpression.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
