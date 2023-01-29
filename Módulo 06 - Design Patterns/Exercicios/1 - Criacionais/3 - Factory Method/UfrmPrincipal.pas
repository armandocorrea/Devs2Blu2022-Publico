unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtValor: TEdit;
    edtQtdParcelas: TEdit;
    cmbPrazoPagamento: TComboBox;
    btnGerar: TButton;
    Memo1: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnGerarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UTipoPrazo, UFabricaPrazos;

procedure TfrmPrincipal.btnGerarClick(Sender: TObject);
var
  xFactoryMethod: IFactoryMethod;
  xTipoPrazo: ITipoPrazo;

  xValor: Real;
  xQtdParcelas: Integer;
begin
  //Instancia a fábrica (Factory Method)
  xFactoryMethod := TFabricaPrazos.Create;
  //Obtem o produto, baseado no parâmetro informado
  xTipoPrazo     := xFactoryMethod.ConsultarPrazo(cmbPrazoPagamento.Text);

  xValor := StrToFloatDef(edtValor.Text, 0);
  xQtdParcelas := StrToIntDef(edtQtdParcelas.Text, 0);

  Memo1.Clear;
  Memo1.Lines.Add(xTipoPrazo.ConsultarDescricao);
  Memo1.Lines.Add(xTipoPrazo.ConsultarJuros);
  Memo1.Lines.Add(xTipoPrazo.ConsultarProjecao(
    StrToFloat(edtValor.Text), StrToInt(edtQtdParcelas.Text)));
  Memo1.Lines.Add(xTipoPrazo.ConsultarTotal);
end;

end.
