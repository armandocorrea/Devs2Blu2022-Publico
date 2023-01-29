program Decorator;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UInterfaceComponent in 'pattern\Decorator\UInterfaceComponent.pas',
  UConcreteComponent in 'pattern\Decorator\UConcreteComponent.pas',
  UDecorator in 'pattern\Decorator\UDecorator.pas',
  UConcreteDecorator_DataHora in 'pattern\Decorator\UConcreteDecorator_DataHora.pas',
  UConcreteDecorator_Usuario in 'pattern\Decorator\UConcreteDecorator_Usuario.pas',
  UConcreteDecorator_Windows in 'pattern\Decorator\UConcreteDecorator_Windows.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
