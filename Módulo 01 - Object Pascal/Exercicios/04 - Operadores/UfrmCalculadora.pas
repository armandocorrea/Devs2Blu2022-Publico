unit UfrmCalculadora;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TOperadores = (opSomar, opSubtrair, opMultiplicar, opDividir, opResto, opDivisaoInteira);

  TfrmCalculadora = class(TForm)
    edtNumerador: TEdit;
    edtDenominador: TEdit;
    edtResultado: TEdit;
    Label1: TLabel;
    cmbOperador: TComboBox;
    Label2: TLabel;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCalculadora: TfrmCalculadora;

implementation

{$R *.dfm}

procedure TfrmCalculadora.Button1Click(Sender: TObject);
var
  xNumero1: Integer;
  xNumero2: Integer;
  xResultado: Integer;
begin
  xNumero1 := StrToIntDef(edtNumerador.Text, 0);
  xNumero2 := StrToIntDef(edtDenominador.Text, 0);

  xResultado := 0;

  case TOperadores(cmbOperador.ItemIndex) of
    opSomar:
    begin
      xResultado := xNumero1 + xNumero2;
    end;
    opSubtrair:
    begin
      xResultado := xNumero1 - xNumero2;
    end;
    opMultiplicar:
    begin
      xResultado := xNumero1 * xNumero2;
    end;
    opDividir:
    begin
      xResultado := Trunc(xNumero1 / xNumero2);
    end;
    opResto:
    begin
      xResultado := (xNumero1 mod xNumero2);
    end;
    opDivisaoInteira:
    begin
      xResultado := xNumero1 div xNumero2;
    end;
  end;

  edtResultado.Text := IntToStr(xResultado);
end;

end.
