program Strategy;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UInterface_Strategy in 'pattern\Strategy\UInterface_Strategy.pas',
  UConcrete_StrategyDLL in 'pattern\Strategy\UConcrete_StrategyDLL.pas',
  WebService.RegExLib in 'pattern\Strategy\WebService.RegExLib.pas',
  UConcrete_StrategyRegExLib in 'pattern\Strategy\UConcrete_StrategyRegExLib.pas',
  UConcrete_StrategyMailBoxLayer in 'pattern\Strategy\UConcrete_StrategyMailBoxLayer.pas',
  UContext in 'pattern\Strategy\UContext.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
