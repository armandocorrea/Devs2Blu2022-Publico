unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtNumero1: TEdit;
    edtNumero2: TEdit;
    Label2: TLabel;
    cmbOperacoes: TComboBox;
    btnCalcular: TButton;
    lblResultado: TLabel;
    Label3: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
    procedure Calcular;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UCalculadora;

{$R *.dfm}

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  Self.Calcular;
end;

procedure TfrmPrincipal.Calcular;
var
  xCalculadora: TCalculadora;
  xNum1, xNum2: Double;
begin
  if not TryStrToFloat(edtNumero1.Text, xNum1) then
    raise Exception.Create('Valor incorreto para Número 1!');

  if not TryStrToFloat(edtNumero2.Text, xNum2) then
    raise Exception.Create('Valor incorreto para Número 2!');

  xCalculadora := TCalculadora.Create;

  try
    case TEnumOperacoes(cmbOperacoes.ItemIndex) of
      opSomar:
        lblResultado.Caption := xCalculadora.Somar(xNum1, xNum2).ToString;
      opSubtrair:
        lblResultado.Caption := xCalculadora.Subtrair(xNum1, xNum2).ToString;
      opMultiplicar:
        lblResultado.Caption := xCalculadora.Multiplicar(xNum1, xNum2).ToString;
      opDividir:
        lblResultado.Caption := xCalculadora.Dividir(xNum1, xNum2).ToString;
    end;
  finally
    FreeAndNil(xCalculadora);
  end;
end;

end.
