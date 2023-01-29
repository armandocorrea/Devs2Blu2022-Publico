program IMC;

uses
  System.StartUpCopy,
  FMX.Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {frmPrincipal};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
