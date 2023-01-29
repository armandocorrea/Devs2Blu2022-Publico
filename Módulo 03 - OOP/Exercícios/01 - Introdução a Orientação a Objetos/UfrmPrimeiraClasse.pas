unit UfrmPrimeiraClasse;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TfrmPrimeiraClasse = class(TForm)
    Label1: TLabel;
    edtX_A: TEdit;
    edtX_B: TEdit;
    edtX_C: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtY_A: TEdit;
    edtY_B: TEdit;
    edtY_C: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    btnCalcular: TButton;
    lblResultado: TLabel;
    lblAreaTrianguloY: TLabel;
    lblAreaTrianguloX: TLabel;
    btnCalcularOOP: TButton;
    procedure btnCalcularClick(Sender: TObject);
    procedure btnCalcularOOPClick(Sender: TObject);
  private
    { Private declarations }
    procedure CalcularAreas;
    procedure CalcularAreasOOP;
  public
    { Public declarations }
  end;

var
  frmPrimeiraClasse: TfrmPrimeiraClasse;

implementation

uses
  UTriangulo;

{$R *.DFM}

procedure TfrmPrimeiraClasse.btnCalcularClick(Sender: TObject);
begin
  Self.CalcularAreas;
end;

procedure TfrmPrimeiraClasse.CalcularAreas;
var
  xP: Double;
  xA, xB, xC: Double;
  xAreaX: Double;
  xAreaY: Double;
begin
  //Triangulo X
  xA := StrToFloatDef(edtX_A.Text,0);
  xB := StrToFloatDef(edtX_B.Text,0);
  xC := StrToFloatDef(edtX_C.Text,0);

  xP     := (xA + xB + xC) / 2;
  xAreaX := Sqrt(xP * (xP - xA) * (xP - xB) * (xP - xC));

  //Triangulo Y
  xA := StrToFloatDef(edtY_A.Text,0);
  xB := StrToFloatDef(edtY_B.Text,0);
  xC := StrToFloatDef(edtY_C.Text,0);

  xP     := (xA + xB + xC) / 2;
  xAreaY := Sqrt(xP * (xP - xA) * (xP - xB) * (xP - xC));

  lblAreaTrianguloX.Caption := 'Triangulo X Área: ' + FormatFloat('0.00', xAreaX);
  lblAreaTrianguloY.Caption := 'Triangulo Y Área: ' + FormatFloat('0.00', xAreaY);

  if (xAreaX > xAreaY) then
    lblResultado.Caption := 'A área do triangulo X é maior.'
  else
    lblResultado.Caption := 'A área do triangulo Y é maior.';
end;

procedure TfrmPrimeiraClasse.btnCalcularOOPClick(Sender: TObject);
begin
  Self.CalcularAreasOOP;
end;

procedure TfrmPrimeiraClasse.CalcularAreasOOP;
var
  xTrianguloX: TTriangulo;
  xTrianguloY: TTriangulo;

  xAreaX: Double;
  xAreaY: Double;
begin
  xTrianguloX := TTriangulo.Create;
  xTrianguloY := TTriangulo.Create;

  try
    //Primeiro Triangulo
    xTrianguloX.a := StrToFloatDef(edtX_A.Text,0);
    xTrianguloX.b := StrToFloatDef(edtX_B.Text,0);
    xTrianguloX.c := StrToFloatDef(edtX_C.Text,0);

    xAreaX := xTrianguloX.Area;

    //Segundo Triangulo
    xTrianguloY.a := StrToFloatDef(edtY_A.Text,0);
    xTrianguloY.b := StrToFloatDef(edtY_B.Text,0);
    xTrianguloY.c := StrToFloatDef(edtY_C.Text,0);

    xAreaY := xTrianguloY.Area;

    lblAreaTrianguloX.Caption := 'Triangulo X Área: ' +
     FormatFloat('0.00', xAreaX);
    lblAreaTrianguloY.Caption := 'Triangulo Y Área: ' +
     FormatFloat('0.00', xAreaY);

    if (xAreaX > xAreaY) then
      lblResultado.Caption := 'A área do triangulo X é maior.'
    else
      lblResultado.Caption := 'A área do triangulo Y é maior.';
  finally
    FreeAndNil(xTrianguloX);
    FreeAndNil(xTrianguloY);
  end;
end;

end.
