unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Imaging.jpeg;

type
  TTipoCombustivel = (tcAlcool = 1, tcGasolina, tcDiesel);

  TCarro = record
    Modelo: String;
    TipoCombustivel: TTipoCombustivel;
    Valor: Currency;
    Desconto: Currency;
    Total: Currency
  end;

  TfrmPrincipal = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    btnVender: TButton;
    lblDescontos: TLabel;
    lblTotalPago: TLabel;
    btnListar: TButton;
    mmLista: TMemo;
    imgCarango: TImage;
    procedure btnVenderClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
  private
    { Private declarations }
    FListaCarros: Array of TCarro;

    procedure VenderCarros;
    procedure AplicarDesconto(var aCarro: TCarro);
    procedure ApresentarItemVendido(const aCarro: TCarro);
    procedure AdicionarVenda(const aCarro: TCarro);
    procedure CalcularTotalizadores;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AdicionarVenda(const aCarro: TCarro);
begin
  SetLength(FListaCarros, Length(FListaCarros)+1);
  FListaCarros[Length(FListaCarros)-1] := aCarro;
end;

procedure TfrmPrincipal.AplicarDesconto(var aCarro: TCarro);
const
  c25Porcento = 0.25;
  c21Porcento = 0.21;
  c14Porcento = 0.14;
begin
  aCarro.Desconto := 0;

  case aCarro.TipoCombustivel of
    tcAlcool:
      aCarro.Desconto := aCarro.Valor * c25Porcento;
    tcGasolina:
      aCarro.Desconto := aCarro.Valor * c21Porcento;
    tcDiesel:
      aCarro.Desconto := aCarro.Valor * c14Porcento;
  end;

  aCarro.Total := aCarro.Valor - aCarro.Desconto;
end;

procedure TfrmPrincipal.ApresentarItemVendido(const aCarro: TCarro);
const
  cFrase = 'Modelo %s - Desconto R$ %s - Valor Pago R$ %s';
begin
  mmLista.Lines.Add(Format(cFrase, [aCarro.Modelo,
                                    FormatCurr('#,###,###,##0.00', aCarro.Desconto),
                                    FormatCurr('#,###,###,##0.00', aCarro.Total)]));
end;

procedure TfrmPrincipal.btnListarClick(Sender: TObject);
begin
  Self.CalcularTotalizadores;

  imgCarango.Visible   := False;
  mmLista.Visible      := True;
  lblDescontos.Visible := True;
  lblTotalPago.Visible := True;
end;

procedure TfrmPrincipal.btnVenderClick(Sender: TObject);
begin
  Self.VenderCarros;
end;

procedure TfrmPrincipal.CalcularTotalizadores;
var
  I: Integer;
  xTotalDescontos, xTotalPago: Double;
begin
  xTotalDescontos := 0;
  xTotalPago      := 0;

  for I := 0 to Length(FListaCarros)-1 do
  begin
    xTotalDescontos := xTotalDescontos + FListaCarros[i].Desconto;
    xTotalPago      := xTotalPago + FListaCarros[i].Total;
  end;

  lblDescontos.Caption := 'R$ ' + FormatCurr('#,###,###,##0.00', xTotalDescontos);
  lblTotalPago.Caption := 'R$ ' + FormatCurr('#,###,###,##0.00', xTotalPago);
end;

procedure TfrmPrincipal.VenderCarros;
var
  xCarro: TCarro;
begin
  FillChar(xCarro, SizeOf(xCarro), 0);

  repeat
    xCarro.Modelo          := InputBox('Informe', 'Informe o Modelo do Carro', '');
    xCarro.TipoCombustivel := TTipoCombustivel(StrToIntDef(InputBox('Informe', 'Informe o Tipo de Combustível (1-Álcool 2-Gasolina 3-Diesel)', ''),0));
    xCarro.Valor           := StrToFloatDef(InputBox('Informe', 'Informe o Valor do Carro', '0,00'), 0);

    if xCarro.Valor <= 0 then
      Break;

    Self.AplicarDesconto(xCarro);
    Self.ApresentarItemVendido(xCarro);
    Self.AdicionarVenda(xCarro);
  until (False);

  btnVender.Enabled := False;
  btnListar.Enabled := True;
  btnListar.SetFocus;
end;

end.
