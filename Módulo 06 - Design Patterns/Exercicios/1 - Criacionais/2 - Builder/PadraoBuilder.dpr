program PadraoBuilder;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UProduct in 'pattern\entities\UProduct.pas',
  UBuilder in 'pattern\builder\UBuilder.pas',
  UConcreteBuilder in 'pattern\builder\UConcreteBuilder.pas',
  UDirector in 'pattern\builder\UDirector.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
