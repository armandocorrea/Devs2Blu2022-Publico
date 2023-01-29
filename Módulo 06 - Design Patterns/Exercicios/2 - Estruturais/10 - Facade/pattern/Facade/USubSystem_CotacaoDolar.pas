unit USubSystem_CotacaoDolar;

interface

type
  TSubsystemCotacaoDolar = class
  public
    function ConsultarCotacaoDolar: Real;
  end;

implementation

{ TSubsystemCotacaoDolar }

uses FachadaWSSGS1, Soap.SOAPHTTPClient, System.SysUtils;

function TSubsystemCotacaoDolar.ConsultarCotacaoDolar: Real;
var
  xWebServiceCotacao: FachadaWSSGS;
  xHTTPRIO: THTTPRIO;
  xFormatSettings: TFormatSettings;
begin
  // cria uma instância da classe THTTPRIO
  xHTTPRIO := THTTPRIO.Create(nil);

  // obtém uma instância do WSDL
  xWebServiceCotacao := GetFachadaWSSGS(True, '', xHTTPRIO);

  // customiza o separador de decimais para evitar erro de conversão
  FormatSettings.DecimalSeparator := '.';

  // invoca o WebService para buscar a cotação do Dólar do dia
  Result := StrToFloat(xWebServiceCotacao.getUltimoValorVO(1).ultimoValor.sValor, FormatSettings);
end;

end.
