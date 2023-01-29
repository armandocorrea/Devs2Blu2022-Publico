program ComAbstractFactory;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UApple in 'pattern\factorys\UApple.pas',
  UDell in 'pattern\factorys\UDell.pas',
  UInterfaces in 'pattern\factorys\UInterfaces.pas',
  UIMac in 'pattern\entities\UIMac.pas',
  UInspiron in 'pattern\entities\UInspiron.pas',
  UMacBook in 'pattern\entities\UMacBook.pas',
  UVostro in 'pattern\entities\UVostro.pas';

{$R *.res}

begin
  //ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
