unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UConcreteObserver_Log,
  UConcreteObserver_Historico, UConcreteObserver_Saldo, UConcreteSubject;

type
  TfrmPrincipal = class(TForm)
    fraCadastro1: TfraCadastro;
    fraSaldo1: TfraSaldo;
    fraHistorico1: TfraHistorico;
    fraLog1: TfraLog;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  fraCadastro1.AdicionarObserver(fraSaldo1);
  fraCadastro1.AdicionarObserver(fraHistorico1);
  fraCadastro1.AdicionarObserver(fraLog1);
end;

end.
