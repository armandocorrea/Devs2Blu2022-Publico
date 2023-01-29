program Calculadora;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UIntCalculatorService in 'model\services\UIntCalculatorService.pas',
  UCalculatorServiceDefault in 'model\services\UCalculatorServiceDefault.pas',
  UCalculatorService in 'model\services\UCalculatorService.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
