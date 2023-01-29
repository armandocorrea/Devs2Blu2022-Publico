program FactoryMethod;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UTipoPrazo in 'pattern\factoryMethod\UTipoPrazo.pas',
  UPrazoMensal in 'pattern\factoryMethod\UPrazoMensal.pas',
  UPrazoAnual in 'pattern\factoryMethod\UPrazoAnual.pas',
  UFabricaPrazos in 'pattern\factoryMethod\UFabricaPrazos.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
