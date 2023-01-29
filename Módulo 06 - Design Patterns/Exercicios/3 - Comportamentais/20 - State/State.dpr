program State;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UInterface_State in 'pattern\State\UInterface_State.pas',
  UConcrete_State in 'pattern\State\UConcrete_State.pas',
  UStateBronze in 'pattern\State\UStateBronze.pas',
  UStatePrata in 'pattern\State\UStatePrata.pas',
  UStateOuro in 'pattern\State\UStateOuro.pas',
  UContext in 'pattern\State\UContext.pas',
  UEnumerated in 'pattern\State\UEnumerated.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
