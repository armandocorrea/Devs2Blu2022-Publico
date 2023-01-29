program Bridge;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UImplementor in 'pattern\Bridge\UImplementor.pas',
  UConcreteImplementorXLS in 'pattern\Bridge\UConcreteImplementorXLS.pas',
  UConcreteImplementorHTML in 'pattern\Bridge\UConcreteImplementorHTML.pas',
  UAbstraction in 'pattern\Bridge\UAbstraction.pas',
  URefinedAbstractionClientes in 'pattern\Bridge\URefinedAbstractionClientes.pas',
  URefinedAbstractionProdutos in 'pattern\Bridge\URefinedAbstractionProdutos.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
