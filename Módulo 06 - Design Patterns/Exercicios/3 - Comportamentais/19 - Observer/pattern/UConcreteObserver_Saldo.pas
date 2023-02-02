unit UConcreteObserver_Saldo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,

  UObserver,
  UNotificacao;

type
  TfraSaldo = class(TFrame, IObserver)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    lblCreditos: TLabel;
    lblDebitos: TLabel;
    lblSaldo: TLabel;
  private
    { Private declarations }
    FCreditos: Real;
    FDebitos: Real;
  public
    { Public declarations }
    procedure Atualizar(aNotificacao: TNotificacao);
  end;

implementation

{$R *.dfm}

{ TFrame1 }

procedure TfraSaldo.Atualizar(aNotificacao: TNotificacao);
var
  xSaldo: Real;
begin
  // Soma o valor à variável conforme o tipo de operação
  if aNotificacao.Operacao = 'Crédito' then
    FCreditos := FCreditos + aNotificacao.Valor
  else if aNotificacao.Operacao = 'Débito' then
    FDebitos := FDebitos + aNotificacao.Valor;

  // Calcula o saldo
  xSaldo := FCreditos - FDebitos;

  lblCreditos.Caption := FormatFloat('###,##0.00', FCreditos);
  lblDebitos.Caption  := FormatFloat('###,##0.00', FDebitos);
  lblSaldo.Caption    := FormatFloat('###,##0.00', xSaldo);
end;

end.
