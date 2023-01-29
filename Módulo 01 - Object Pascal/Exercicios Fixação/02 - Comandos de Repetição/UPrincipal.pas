unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TEnumComando = (stFor, stWhile, stRepeat);

  TForm1 = class(TForm)
    Label1: TLabel;
    rgComandos: TRadioGroup;
    btnExecutar: TButton;
    edtInput2: TEdit;
    edtInput1: TEdit;
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
    procedure ComandoFor;
    procedure ComandoWhile;
    procedure ComandoRepeat;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnExecutarClick(Sender: TObject);
begin
  case TEnumComando(rgComandos.ItemIndex) of
    stFor:
      Self.ComandoFor;
    stWhile:
      Self.ComandoWhile;
    stRepeat:
      Self.ComandoRepeat;
  end;
end;

(*
  Método responsável por somar somente números pares
*)
procedure TForm1.ComandoFor;
var
  i: Integer;
  xValorInicial: Integer;
  xValorFinal: Integer;
  xResultado: Integer;
begin
  xResultado := 0;
  xValorInicial := StrToIntDef(edtInput1.Text,0);
  xValorFinal   := StrToIntDef(edtInput2.Text,0);

  for i:=xValorInicial to xValorFinal do
  begin
    if (i mod 2) = 0 then
      xResultado := xResultado + i;
  end;

  ShowMessage(IntToStr(xResultado));
end;

(*
  Método responsável por realizar a retirada de valor (sangria) no caixa
*)
procedure TForm1.ComandoWhile;
var
  xDias: Word;
  xValorCaixaInicial: Double;
  xValorCaixaAtual: Double;
  xValorSangria: Double;
begin
  xDias              := 0;
  xValorCaixaInicial := StrToFloat(edtInput1.Text);
  xValorCaixaAtual   := xValorCaixaInicial;
  xValorSangria      := StrToFloat(edtInput2.Text);

  if (xValorSangria > xValorCaixaAtual) then
  begin
    ShowMessage('Você não possui saldo.');
    Exit;
  end;

  while (xValorCaixaAtual > 0) do
  begin
    Inc(xDias);
    xValorCaixaAtual := xValorCaixaAtual - xValorSangria;
  end;

  ShowMessage('Você acabou com sua reserva em ' + IntToStr(xDias) + ' dias.');
end;

(*
  Método responsável por realizar a conta de quantos dias faltam para eu completar minha renda de valores
*)
procedure TForm1.ComandoRepeat;
var
  xDias: Word;
  xValorPoupancaMeta: Double;
  xValorPoupancaAtual: Double;
  xValorRecebido: Double;
begin
  xDias               := 0;
  xValorPoupancaAtual := 0;
  xValorPoupancaMeta  := StrToFloat(edtInput1.Text);
  xValorRecebido      := StrToFloat(edtInput2.Text);

  if (xValorRecebido >= xValorPoupancaMeta) then
  begin
    ShowMessage('Parabéns você atingiu seu objetivo de primeira.');
    Exit;
  end;

  repeat
    Inc(xDias);
    xValorPoupancaAtual := xValorPoupancaAtual + xValorRecebido;
  until (xValorPoupancaAtual >= xValorPoupancaMeta);

  ShowMessage('Você atingirá sua meta em ' + IntToStr(xDias) + ' dias.');
end;

end.
