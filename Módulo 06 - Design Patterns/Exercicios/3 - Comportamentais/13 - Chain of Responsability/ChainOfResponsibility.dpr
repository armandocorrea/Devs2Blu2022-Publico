program ChainOfResponsibility;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UInterfaceHandler in 'pattern\UInterfaceHandler.pas',
  UConcreteHandler_CSV in 'pattern\UConcreteHandler_CSV.pas',
  UConcreteHandler_XML in 'pattern\UConcreteHandler_XML.pas',
  UConcreteHandler_JSON in 'pattern\UConcreteHandler_JSON.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
