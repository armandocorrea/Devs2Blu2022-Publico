unit UBomba;

interface

type
  TEnumTipoCombustivel = (tpAlcool, tpGasolina);

  TBomba = class
    private
      FTipoCombustivel: TEnumTipoCombustivel;
      FValorLitro: Currency;
      FQuantidadeCombustivel: Double;

      function GetQuantidadeCombustivel: Double;
      function GetTipoCombustivel: TEnumTipoCombustivel;
      function GetValorLitro: Currency;
    public
      procedure AbastecerPorValor(const aValor: Currency);
      procedure AbastecerPorLitro(const aQtdeLitro: Double);
      procedure AlterarValor(const aNovoValor: Currency);
      procedure AlterarCombustivel(const aNovoTipo: TEnumTipoCombustivel);
      procedure AlterarQuantidadeCombustivel(const aNovaQuantidade: Double);

      property TipoCombustivel: TEnumTipoCombustivel read GetTipoCombustivel;
      property ValorLitro: Currency                  read GetValorLitro;
      property QuantidadeCombustivel: Double         read GetQuantidadeCombustivel;
  end;

implementation

uses
  System.SysUtils;

{ TBomba }

procedure TBomba.AbastecerPorLitro(const aQtdeLitro: Double);
begin
  if FQuantidadeCombustivel < aQtdeLitro then
    raise Exception.Create('Quantidade na Bomba Insuficiente');

  FQuantidadeCombustivel := FQuantidadeCombustivel - aQtdeLitro;
end;

procedure TBomba.AbastecerPorValor(const aValor: Currency);
var
  xQtdeCombustivelAbastecer: Double;
begin
  if aValor < FValorLitro then
    raise Exception.Create('Valor a abastecer menor que o permitido.');

  if FValorLitro <= 0 then
    raise Exception.Create('Não foi definido o Valor do Litro.');

  xQtdeCombustivelAbastecer := aValor / FValorLitro;

  if xQtdeCombustivelAbastecer > FQuantidadeCombustivel then
    raise Exception.Create('Quantidade na Bomba Insuficiente');

  FQuantidadeCombustivel := FQuantidadeCombustivel - xQtdeCombustivelAbastecer;
end;

procedure TBomba.AlterarCombustivel(const aNovoTipo: TEnumTipoCombustivel);
begin
  FTipoCombustivel := aNovoTipo;
end;

procedure TBomba.AlterarQuantidadeCombustivel(const aNovaQuantidade: Double);
begin
  FQuantidadeCombustivel := aNovaQuantidade;
end;

procedure TBomba.AlterarValor(const aNovoValor: Currency);
begin
  FValorLitro := aNovoValor;
end;

function TBomba.GetQuantidadeCombustivel: Double;
begin
  Result := FQuantidadeCombustivel;
end;

function TBomba.GetTipoCombustivel: TEnumTipoCombustivel;
begin
  Result := FTipoCombustivel;
end;

function TBomba.GetValorLitro: Currency;
begin
  Result := FValorLitro;
end;

end.
