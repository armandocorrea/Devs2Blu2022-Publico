program Memento;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UMemento in 'pattern\Memento\UMemento.pas',
  UOriginator in 'pattern\Memento\UOriginator.pas',
  UCaretaker in 'pattern\Memento\UCaretaker.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
