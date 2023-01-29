program Flyweight;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UConcreteFlyweight in 'pattern\Flyweight\UConcreteFlyweight.pas',
  UInterface in 'pattern\Flyweight\UInterface.pas',
  UFlyweightFactory in 'pattern\Flyweight\UFlyweightFactory.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
