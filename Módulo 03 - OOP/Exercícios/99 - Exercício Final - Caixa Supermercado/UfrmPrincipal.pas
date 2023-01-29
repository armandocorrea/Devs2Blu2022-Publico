unit UfrmPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls, jpeg,

  UCaixa, Vcl.Imaging.pngimage;

type
  TfrmCaixaGoDev = class(TForm)
    Panel2: TPanel;
    Panel3: TPanel;
    lblResultado: TLabel;
    edtValor: TEdit;
    lblValor: TLabel;
    rgOpcoes: TRadioGroup;
    btnExecutar: TButton;
    btnSair: TButton;
    Image1: TImage;
    btnExibirOperacoes: TButton;
    memoOperacoes: TMemo;
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure rgOpcoesClick(Sender: TObject);
    procedure btnExibirOperacoesClick(Sender: TObject);
  private
    { Private declarations }
    FCaixa: TCaixa;

    procedure AbrirCaixa;
    procedure AdicionarDinheiro;
    procedure RetirarDinheiro;
    procedure ExibirSaldoAtual;
    procedure FecharCaixa;
  public
    { Public declarations }
  end;

var
  frmCaixaGoDev: TfrmCaixaGoDev;

implementation

{$R *.DFM}

procedure TfrmCaixaGoDev.btnSairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmCaixaGoDev.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;

  if Assigned(FCaixa) then
    FreeAndNil(FCaixa);
end;

procedure TfrmCaixaGoDev.FormCreate(Sender: TObject);
begin
  FCaixa := TCaixa.Create;
end;

procedure TfrmCaixaGoDev.btnExecutarClick(Sender: TObject);
begin
  memoOperacoes.Visible := False;

  case TOperacoes(rgOpcoes.ItemIndex) of
    stAbrirCaixa:
      Self.AbrirCaixa;
    stSuprimento:
      Self.AdicionarDinheiro;
    stSangria:
      Self.RetirarDinheiro;
    stSaldoAtual:
      Self.ExibirSaldoAtual;
    stFecharCaixa:
      Self.FecharCaixa;
  end;
end;

procedure TfrmCaixaGoDev.AbrirCaixa;
var
  xSaldoInicial: Double;
  xMensagem: String;
begin
  if not TryStrToFloat(edtValor.Text, xSaldoInicial) then
    raise Exception.Create('Valor informado para abrir o caixa está incorreto.');

  if (not Assigned(FCaixa)) then
    FCaixa := TCaixa.Create
  else if FCaixa.CaixaAberto then
    raise Exception.Create('O caixa já está aberto.');

  FCaixa.AbrirCaixa(xSaldoInicial);

  xMensagem := 'Caixa foi Aberto';
  lblResultado.Caption := xMensagem;
end;

procedure TfrmCaixaGoDev.AdicionarDinheiro;
var
  xValorSuprimento: Double;
  xMensagem: String;
begin
  if not TryStrToFloat(edtValor.Text, xValorSuprimento) then
    raise Exception.Create('Valor informado para o Suprimento do caixa está incorreto.');

  if ((not Assigned(FCaixa)) or (not (FCaixa.CaixaAberto))) then
    raise Exception.Create('O Caixa ainda não foi aberto.');

  FCaixa.AdicionarValor(xValorSuprimento);

  xMensagem := 'Adicionado R$ ' + edtValor.Text + ' no Caixa.';
  lblResultado.Caption := xMensagem;
end;

procedure TfrmCaixaGoDev.RetirarDinheiro;
var
  xValorSangria: Double;
  xMensagem: String;
begin
  if not TryStrToFloat(edtValor.Text, xValorSangria) then
    raise Exception.Create('Valor informado para a Sangria do caixa está incorreto.');

  if ((not Assigned(FCaixa)) or (not (FCaixa.CaixaAberto))) then
    raise Exception.Create('O Caixa ainda não foi aberto.');

  FCaixa.RetirarValor(xValorSangria);

  xMensagem := 'Retirado R$ ' + edtValor.Text + ' do Caixa.';
  lblResultado.Caption := xMensagem;
end;

procedure TfrmCaixaGoDev.ExibirSaldoAtual;
var
  xMensagem: String;
begin
  xMensagem := '';

  if (not Assigned(FCaixa)) then
    xMensagem := 'O Caixa ainda não foi aberto.';

  if (xMensagem = EmptyStr) then
    xMensagem := 'O saldo atual do caixa é de R$ ' + FloatToStr(FCaixa.SaldoAtual);

  lblResultado.Caption := xMensagem;
end;

procedure TfrmCaixaGoDev.FecharCaixa;
var
  xMensagem: String;
begin
  xMensagem := '';

  if ((not Assigned(FCaixa)) or (not (FCaixa.CaixaAberto))) then
    raise Exception.Create('O Caixa ainda não foi aberto.');

  FCaixa.FecharCaixa;
  
  xMensagem := 'Seu caixa terminou com R$ ' + FloatToStr(FCaixa.SaldoAtual);
  lblResultado.Caption := xMensagem;
end;

procedure TfrmCaixaGoDev.rgOpcoesClick(Sender: TObject);
begin
  lblValor.Enabled := True;
  edtValor.Enabled := True;

  case TOperacoes(rgOpcoes.ItemIndex) of
    stFecharCaixa, stSaldoAtual:
    begin
      lblValor.Enabled := False;
      edtValor.Text    := EmptyStr;
      edtValor.Enabled := False;
    end;
  end;  
end;

procedure TfrmCaixaGoDev.btnExibirOperacoesClick(Sender: TObject);
begin
  if ((not Assigned(FCaixa)) or (not (FCaixa.CaixaAberto))) then
    raise Exception.Create('O Caixa ainda não foi aberto.');

  FCaixa.ExibirOperacoes(memoOperacoes.Lines);
  memoOperacoes.Visible := True;
end;

end.
