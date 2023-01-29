unit UFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Effects, FMX.Layouts, FMX.Objects, FMX.Controls.Presentation;

type
  TfrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    Rectangle1: TRectangle;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    ShadowEffect1: TShadowEffect;
    Label1: TLabel;
    Layout2: TLayout;
    Label2: TLabel;
    edtAltura: TEdit;
    Layout3: TLayout;
    Label3: TLabel;
    edtPeso: TEdit;
    Layout4: TLayout;
    lblResultado: TLabel;
    Layout5: TLayout;
    btnCalcular: TButton;
    Rectangle3: TRectangle;
    Label4: TLabel;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
var
  xIMC: Double;
  xAltura: Double;
  xPeso: Double;
const
  C_MENSAGEM = '%s (%f)';
begin
  if not TryStrToFloat(edtAltura.Text, xAltura) then
    raise Exception.Create('Altura informada incorretamente!');

  if not TryStrToFloat(edtPeso.Text, xPeso) then
    raise Exception.Create('Peso informado incorretamente!');

  xAltura := xAltura / 100;

  xIMC := xPeso / (xAltura * xAltura);

  if xIMC < 18.5 then
    lblResultado.Text := 'Magreza'
  else if (xIMC >= 18.5) and (xIMC < 25) then
    lblResultado.Text := 'Normal'
  else if (xIMC >= 25) and (xIMC < 30) then
    lblResultado.Text := 'Sobrepeso Grau I'
  else if (xIMC >= 30) and (xIMC < 40) then
    lblResultado.Text := 'Obesidade Grau II'
  else if (xIMC >= 40) then
    lblResultado.Text := 'Obesidade Grau III';

  lblResultado.Text := Format(C_MENSAGEM, [lblResultado.Text, xIMC]);
end;

end.
