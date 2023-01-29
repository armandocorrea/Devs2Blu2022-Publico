program ToDoList_Delphi;

uses
  System.StartUpCopy,
  FMX.Forms,
  uFrmPrincipal in 'uFrmPrincipal.pas' {frmPrincipal},
  SharedPreference in 'SharedPreference.pas',
  ufrmSplash in 'ufrmSplash.pas' {frmSplash};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmSplash, frmSplash);
  Application.Run;
end.
