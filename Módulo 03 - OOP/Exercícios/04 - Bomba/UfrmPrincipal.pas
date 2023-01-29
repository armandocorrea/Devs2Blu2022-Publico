unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.jpeg, Vcl.Imaging.pngimage, UBomba;

type
  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Image1: TImage;
    Label1: TLabel;
    edtValor: TEdit;
    rgTipo: TRadioGroup;
    rgAbastecimento: TRadioGroup;
    Label2: TLabel;
    Label3: TLabel;
    edtBomba: TEdit;
    btnAbastecer: TButton;
    btnBomba: TButton;
    Image2: TImage;
    lblBomba: TLabel;
    Label4: TLabel;
    edtPreco: TEdit;
    btnAlterarValor: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAbastecerClick(Sender: TObject);
    procedure btnBombaClick(Sender: TObject);
    procedure btnAlterarValorClick(Sender: TObject);
  private
    { Private declarations }
    FBomba: TBomba;

    procedure Abastecer;
    procedure AplicarQtdeBomba;
    procedure AlterarValor;
    procedure ExibirQtde;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

const
  C_VALOR = 0;
  C_LITRO = 1;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Abastecer;
var
  xValor: Currency;
  xLitro: Double;
begin
  if rgAbastecimento.ItemIndex = C_VALOR then
  begin
    if not TryStrToCurr(edtValor.Text, xValor) then
      raise Exception.Create('Entre com um valor válido!');

    FBomba.AbastecerPorValor(xValor);
  end
  else if rgAbastecimento.ItemIndex = C_LITRO then
  begin
    if not TryStrToFloat(edtValor.Text, xLitro) then
      raise Exception.Create('Entre com uma Qtde válida!');

    FBomba.AbastecerPorValor(xLitro);
  end;

  Self.ExibirQtde;
end;

procedure TfrmPrincipal.AlterarValor;
var
  xValor: Currency;
begin
  if not TryStrToCurr(edtPreco.Text, xValor) then
    raise Exception.Create('Entre com um valor válido!');

  FBomba.AlterarValor(xValor);
end;

procedure TfrmPrincipal.AplicarQtdeBomba;
var
  xQtde: Double;
begin
  if not TryStrToFloat(edtBomba.Text, xQtde) then
    raise Exception.Create('Entre com uma Qtde válida para a bomba!');

  FBomba.AlterarQuantidadeCombustivel(xQtde);
  Self.ExibirQtde;
end;

procedure TfrmPrincipal.btnAbastecerClick(Sender: TObject);
begin
  Self.Abastecer;
end;

procedure TfrmPrincipal.btnAlterarValorClick(Sender: TObject);
begin
  Self.AlterarValor;
end;

procedure TfrmPrincipal.btnBombaClick(Sender: TObject);
begin
  Self.AplicarQtdeBomba;
end;

procedure TfrmPrincipal.ExibirQtde;
begin
  lblBomba.Caption := 'Qtde: ' +
   FormatFloat('0.00', FBomba.QuantidadeCombustivel) +
   ' litros';
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FBomba);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FBomba := TBomba.Create;
end;

end.
