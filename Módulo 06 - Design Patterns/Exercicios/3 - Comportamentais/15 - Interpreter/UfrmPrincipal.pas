unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    edtEntrada: TEdit;
    btnProcessar: TButton;
    edtSaida: TEdit;
    procedure btnProcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  Contnrs, UTerminalExpression, UContext, UAbstractExpression;

{$R *.dfm}

{
  Selecionar clientes com nome Beatriz
  Selecionar ID, Nome, CPF dos clientes de São Paulo
  Excluir cliente João
  Atualizar nome do cliente 2 para Armando Neto
}

procedure TfrmPrincipal.btnProcessarClick(Sender: TObject);
var
  xContexto: TContext;
  xArvoreSintatica: TObjectList;
  xContador: integer;
begin
  // Cria o contexto
  xContexto := TContext.Create;

  // Cria a árrvore sintática
  xArvoreSintatica := TObjectList.Create;
  try
    // Preenche a entrada do contexto
    xContexto.Entrada := edtEntrada.Text;

    // Configura a árvore sintática com as expressões
    xArvoreSintatica.Add(TComandoExpression.Create);
    xArvoreSintatica.Add(TColunasExpression.Create);
    xArvoreSintatica.Add(TTabelaExpression.Create);
    xArvoreSintatica.Add(TCondicaoExpression.Create);

    // Percorre as expressões para traduzir a entrada em instrução SQL
    for xContador := 0 to Pred(xArvoreSintatica.Count) do
      TAbstractExpression(xArvoreSintatica[xContador]).Interpretar(xContexto);

    // Exibe a saída do contexto (SQL)
    edtSaida.Text := xContexto.Saida;
  finally
    // Libera as variáveis da memória
    FreeAndNil(xArvoreSintatica);
    FreeAndNil(xContexto);
  end;
end;

end.
