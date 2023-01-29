program Elevador;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UElevador in 'UElevador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
