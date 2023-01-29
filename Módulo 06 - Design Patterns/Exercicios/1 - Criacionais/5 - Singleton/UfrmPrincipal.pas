unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnRegistrar: TButton;
    procedure btnRegistrarClick(Sender: TObject);
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

uses ULoggerSingleton;

procedure TfrmPrincipal.btnRegistrarClick(Sender: TObject);
var
  xLogger: TLoggerSingleton;
begin
  xLogger := TLoggerSingleton.Create;
  xLogger.RegistrarLog('Botão clicado');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  xLogger: TLoggerSingleton;
begin
  xLogger := TLoggerSingleton.ObterInstancia;
  xLogger.RegistrarLog('Aplicação iniciada');
end;

end.
