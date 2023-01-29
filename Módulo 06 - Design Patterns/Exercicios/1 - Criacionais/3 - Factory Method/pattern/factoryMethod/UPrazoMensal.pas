unit UPrazoMensal;

interface

uses
  UTipoPrazo;

type
  TPrazoMensal = class(TInterfacedObject, ITipoPrazo)
    private
      FValorTotal: Real;
    public
      function ConsultarDescricao: String;
      function ConsultarJuros: String;
      function ConsultarProjecao(const aValor: Real; const aQtdParcelas: Integer): String;
      function ConsultarTotal: String;
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TPrazoMensal }

function TPrazoMensal.ConsultarDescricao: String;
begin
  Result := 'Prazo Mensal para Pagamento';
end;

function TPrazoMensal.ConsultarJuros: String;
begin
  Result := 'Juros de 3,1% simples ao mês ' + sLineBreak;
end;

function TPrazoMensal.ConsultarProjecao(const aValor: Real;
  const aQtdParcelas: Integer): String;
var
  xProjecao: TStringList;
  xContador: SmallInt;
  xValorAjustado: Real;
  xDataParcela: TDateTime;
begin
  xValorAjustado := aValor;
  xDataParcela   := Date;
  xProjecao      := TStringList.Create;
  try
    for xContador := 1 to aQtdParcelas do
    begin
      xValorAjustado := xValorAjustado + (aValor * 0.031);
      xDataParcela   := IncMonth(xDataParcela, 1);

      xProjecao.Add(Format('Parcela %.2d (%s): %m',
        [xContador, DateToStr(xDataParcela), xValorAjustado]));
    end;

    FValorTotal := xValorAjustado;
    Result := xProjecao.Text;
  finally
    FreeAndNil(xProjecao);
  end;
end;

function TPrazoMensal.ConsultarTotal: String;
begin
  Result := 'Total: ' + FormatFloat('###,##0.00', FValorTotal);
end;

end.
