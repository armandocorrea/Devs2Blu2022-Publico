program Proxy;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmProxy},
  USubject in 'pattern\Proxy\USubject.pas',
  URealSubject in 'pattern\Proxy\URealSubject.pas',
  UProxy in 'pattern\Proxy\UProxy.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProxy, frmProxy);
  Application.Run;
end.
