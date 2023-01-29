program Debugger;

uses
  Vcl.Forms,
  ufrmDebugger in 'ufrmDebugger.pas' {frmDebugger},
  UCalculadora in 'UCalculadora.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmDebugger, frmDebugger);
  Application.Run;
end.
