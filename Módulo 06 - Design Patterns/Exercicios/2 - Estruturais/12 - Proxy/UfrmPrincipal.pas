unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmProxy = class(TForm)
    Label1: TLabel;
    edtOrigemCidade: TEdit;
    edtOrigemEstado: TEdit;
    Label2: TLabel;
    edtDestinoCidade: TEdit;
    edtDestinoEstado: TEdit;
    btnCalcular: TButton;
    edtKeyAPI: TEdit;
    Label3: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProxy: TfrmProxy;

implementation

{$R *.dfm}

uses UProxy, USubject;

procedure TfrmProxy.btnCalcularClick(Sender: TObject);
var
  xCalculador: ICalculador;
  xOrigem: string;
  xDestino: string;
  xDistancia: string;
begin
  // Formata a origem e destino no formato "Cidade,Estado" para ser enviado na URL
  xOrigem  := Format('%s,%s', [edtOrigemCidade.Text, edtOrigemEstado.Text]);
  xDestino := Format('%s,%s', [edtDestinoCidade.Text, edtDestinoEstado.Text]);

  // Cria o Proxy
  xCalculador := TCalculadorProxy.Create;

  // Chama o método de cálculo da distância
  xDistancia := xCalculador.CalcularDistancia(xOrigem, xDestino, edtKeyAPI.Text);

  // Mostra uma mensagem com a distância
  ShowMessage(Format('A distância entre %s e %s é %s', [xOrigem, xDestino, xDistancia]));
end;

end.
