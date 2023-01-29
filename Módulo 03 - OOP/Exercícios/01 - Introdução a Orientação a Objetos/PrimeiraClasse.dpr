program PrimeiraClasse;

uses
  Forms,
  UfrmPrimeiraClasse in 'UfrmPrimeiraClasse.pas' {frmPrimeiraClasse},
  UTriangulo in 'UTriangulo.pas';

{$R *.RES}

begin
  Application.Initialize;
  Application.CreateForm(TfrmPrimeiraClasse, frmPrimeiraClasse);
  Application.Run;
end.
