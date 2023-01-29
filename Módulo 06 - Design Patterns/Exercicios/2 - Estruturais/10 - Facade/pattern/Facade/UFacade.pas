unit UFacade;

interface

type
  TFacade = class
    public
      //Operação do Facade
      function CalcularValorDeVenda(const aFidelidade: Integer; const aPreco: Real): Real;
  end;

implementation

{ TFacade }

uses USubSystem_CalculoLoja, USubSystem_CotacaoDolar, USubSystem_Historico,
  System.SysUtils;

function TFacade.CalcularValorDeVenda(const aFidelidade: Integer;
  const aPreco: Real): Real;
var
  xSubsystemCotacaoDolar: TSubsystemCotacaoDolar;
  xSubsystemCalculoLoja: TSubsystemCalculoLoja;
  xSubsystemHistorico: TSubsystemHistorico;
  xCotacaoDolar: Real;
  xValorVenda: Real;
begin
  // cria as instâncias dos SubSsystems
  xSubsystemCotacaoDolar := TSubsystemCotacaoDolar.Create;
  xSubsystemCalculoLoja  := TSubsystemCalculoLoja.Create;
  xSubsystemHistorico    := TSubsystemHistorico.Create;
  try
    // utiliza o primeiro Subsystem para consultar a cotação do Dólar
    xCotacaoDolar := xSubsystemCotacaoDolar.ConsultarCotacaoDolar;

    // converte em Reais
    xValorVenda := aPreco * xCotacaoDolar;

    // utiliza o segundo Subsytem para aplicar desconto e margem de venda
    xValorVenda := xSubsystemCalculoLoja.CalcularPrecoFinal(aFidelidade, xValorVenda);

    // utiliza o terceiro Subsystem para armazenar o histórico do cálculo
    xSubsystemHistorico.RegistrarHistoricoDoCalculo(xCotacaoDolar, aPreco, xValorVenda);

    // retorna o valor calculado
    Result := xValorVenda;
  finally
    // libera as instâncias da memória
    FreeAndNil(xSubsystemCotacaoDolar);
    FreeAndNil(xSubsystemCalculoLoja);
    FreeAndNil(xSubsystemHistorico);
  end;
end;

end.
