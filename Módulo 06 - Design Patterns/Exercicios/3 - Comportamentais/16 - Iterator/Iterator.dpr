program Iterator;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UCliente in 'pattern\Iterator\UCliente.pas',
  UInterface_Iterator in 'pattern\Iterator\UInterface_Iterator.pas',
  UInterface_Aggregate in 'pattern\Iterator\UInterface_Aggregate.pas',
  UConcrete_Iterator in 'pattern\Iterator\UConcrete_Iterator.pas',
  UConcrete_AggregateCSV in 'pattern\Iterator\UConcrete_AggregateCSV.pas',
  UConcrete_AggregateXML in 'pattern\Iterator\UConcrete_AggregateXML.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
