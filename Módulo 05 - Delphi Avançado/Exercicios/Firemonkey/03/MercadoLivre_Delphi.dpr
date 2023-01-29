program MercadoLivre_Delphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
