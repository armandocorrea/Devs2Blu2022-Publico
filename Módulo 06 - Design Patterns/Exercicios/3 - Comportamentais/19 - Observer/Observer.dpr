program Observer;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UNotificacao in 'pattern\UNotificacao.pas',
  UObserver in 'pattern\UObserver.pas',
  UConcreteObserver_Saldo in 'pattern\UConcreteObserver_Saldo.pas' {fraSaldo: TFrame},
  UConcreteObserver_Historico in 'pattern\UConcreteObserver_Historico.pas' {fraHistorico: TFrame},
  UConcreteObserver_Log in 'pattern\UConcreteObserver_Log.pas' {fraLog: TFrame},
  USubject in 'pattern\USubject.pas',
  UConcreteSubject in 'pattern\UConcreteSubject.pas' {fraCadastro: TFrame};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
