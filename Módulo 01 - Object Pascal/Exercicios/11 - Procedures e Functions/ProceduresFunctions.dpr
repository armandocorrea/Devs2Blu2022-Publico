program ProceduresFunctions;

uses
  Vcl.Forms,
  UfrmProceduresFunctions in 'UfrmProceduresFunctions.pas' {frmProceduresFunctions};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmProceduresFunctions, frmProceduresFunctions);
  Application.Run;
end.
