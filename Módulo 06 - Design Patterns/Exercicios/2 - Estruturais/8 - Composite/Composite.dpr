program Composite;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UComponent_Operation in 'pattern\Composite\UComponent_Operation.pas',
  ULeaf in 'pattern\Composite\ULeaf.pas',
  UComposite in 'pattern\Composite\UComposite.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
