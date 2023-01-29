program Posto;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UBomba in 'UBomba.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
