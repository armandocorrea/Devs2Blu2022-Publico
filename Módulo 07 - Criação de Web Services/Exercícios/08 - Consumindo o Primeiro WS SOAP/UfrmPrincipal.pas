unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtValor: TEdit;
    Label1: TLabel;
    btnEchoDouble: TButton;
    btnHelloWorld: TButton;
    lblResultado: TLabel;
    procedure btnEchoDoubleClick(Sender: TObject);
    procedure btnHelloWorldClick(Sender: TObject);
  private
    { Private declarations }
    procedure EchoDouble;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses IHello_World1;

procedure TfrmPrincipal.btnEchoDoubleClick(Sender: TObject);
begin
  Self.EchoDouble;
end;

procedure TfrmPrincipal.btnHelloWorldClick(Sender: TObject);
begin
  lblResultado.Caption := GetIHello_World.echoHelloWorld;
end;

procedure TfrmPrincipal.EchoDouble;
var
  xValor: Double;
  xResultado: Double;
begin
  if not TryStrToFloat(edtValor.Text, xValor) then
    raise Exception.Create('Valor Inválido');

  xResultado := GetIHello_World.echoDouble(xValor);
  lblResultado.Caption := 'Resultado: ' + xResultado.ToString;
end;

end.
