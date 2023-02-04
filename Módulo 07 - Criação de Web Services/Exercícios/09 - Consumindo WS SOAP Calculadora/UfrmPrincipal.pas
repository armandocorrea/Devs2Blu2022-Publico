unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOperacao = (opSomar, opSubtrair, opMultiplicar, opDividir);

  TfrmPrincipal = class(TForm)
    edtValor1: TEdit;
    edtValor2: TEdit;
    cmbOperacao: TComboBox;
    btnCalcular: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    lblResultado: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    procedure Calcular;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses ICalculadora1;

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  Self.Calcular;
end;

procedure TfrmPrincipal.Calcular;
var
  xValor1, xValor2: Double;
begin
  if not TryStrToFloat(edtValor1.Text, xValor1) then
    raise Exception.Create('Valor 1 Inválido!');

  if not TryStrToFloat(edtValor2.Text, xValor2) then
    raise Exception.Create('Valor 2 Inválido!');

  case TOperacao(cmbOperacao.ItemIndex) of
    opSomar:
      lblResultado.Caption := GetICalculadora.Somar(xValor1, xValor2).ToString;
    opSubtrair:
      lblResultado.Caption := GetICalculadora.Subtrair(xValor1, xValor2).ToString;
    opMultiplicar:
      lblResultado.Caption := GetICalculadora.Multiplicar(xValor1, xValor2).ToString;
    opDividir:
      lblResultado.Caption := GetICalculadora.Dividir(xValor1, xValor2).ToString;
  end;

end;

end.
