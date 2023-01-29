program Adapter;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UWebServiceViaCEP in 'pattern\Adapter\UWebServiceViaCEP.pas',
  UTarget in 'pattern\Adapter\UTarget.pas',
  UAdaptee in 'pattern\Adapter\UAdaptee.pas',
  UAdapter in 'pattern\Adapter\UAdapter.pas',
  UWebServiceCorreios in 'pattern\Adapter\UWebServiceCorreios.pas',
  UInterfaceViaCEP in 'pattern\Adapter\UInterfaceViaCEP.pas';

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
