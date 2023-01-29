program Sakila;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UdmSakila in 'UdmSakila.pas' {dmSakila: TDataModule},
  URelCity in 'URelCity.pas' {frmRelCity},
  URelActoresFilmes in 'URelActoresFilmes.pas' {frmRelAtoresFilmes},
  URelActores in 'URelActores.pas' {frmRelAtores};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmSakila, dmSakila);
  Application.CreateForm(TfrmRelAtoresFilmes, frmRelAtoresFilmes);
  Application.CreateForm(TfrmRelAtores, frmRelAtores);
  Application.Run;
end.
