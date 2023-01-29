program Facade;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  FachadaWSSGS1 in 'pattern\Facade\FachadaWSSGS1.pas',
  USubSystem_CotacaoDolar in 'pattern\Facade\USubSystem_CotacaoDolar.pas',
  USubSystem_CalculoLoja in 'pattern\Facade\USubSystem_CalculoLoja.pas',
  USubSystem_Historico in 'pattern\Facade\USubSystem_Historico.pas',
  UFacade in 'pattern\Facade\UFacade.pas';

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
