unit URealSubject;

interface

uses USubject;

type
  TCalculadorReal = class(TInterfacedObject, ICalculador)
  public
    // Método da Interface
    function CalcularDistancia(const aOrigem, aDestino, aKey: string): string;
  end;

implementation

uses
  SysUtils, IdURI, IdHTTP, System.JSON;

{ TCalculadorReal }

function TCalculadorReal.CalcularDistancia(const aOrigem, aDestino, aKey: string): string;
const
  // Endereço da API do Google Maps
  GOOGLE_MAPS_API =
    'https://maps.googleapis.com/maps/api/distancematrix/json?units=metric&origins=%s&destinations=%s&key=%s';
var
  xIdHTTP: TIdHTTP;
  xEndereco: string;
  xResposta: string;
  // Classe para trabalhar com JSON
  xJSONPrincipal: TJSONObject;
  xJSONLinhas: TJSONObject;
  xJSONElementos: TJSONObject;
  xJSONDistancia: TJSONObject;
begin
  // Cria o componente IdHTTP para executar a consulta na API
  xIdHTTP := TIdHTTP.Create(nil);
  try
    // Configura o endereço de envio de dados para a API
    xEndereco := Format(GOOGLE_MAPS_API, [aOrigem, aDestino, aKey]);

    // "Codifica" a URL no formato correto (por exemplo, tratando acentos)
    xEndereco := TIdURI.URLEncode(xEndereco);

    // Recebe a resposta
    xResposta := xIdHTTP.Get(xEndereco);

    // Interpreta a resposta da API como JSON
    xJSONPrincipal := TJSONObject.ParseJSONValue(xResposta) as TJSONObject;

    // Acessa o array "rows" do JSON
    xJSONLinhas := TJSONArray(xJSONPrincipal.GetValue('rows')).Items[0] as TJSONObject;

    // Acessa o array "elements" do JSON
    xJSONElementos := TJSONArray(xJSONLinhas.GetValue('elements')).Items[0] as TJSONObject;

    // Valida o status do retorno,
    // apresentando uma exceção caso as cidades não sejam encontradas
    if (xJSONElementos.GetValue('status').ToString = '"NOT_FOUND"') or
       (xJSONElementos.GetValue('status').ToString = '"ZERO_RESULTS"') then
      raise Exception.Create('A cidade de origem ou destino não foi encontrada.');

    // Acessa o rótulo "distance"
    xJSONDistancia := xJSONElementos.GetValue('distance') as TJSONObject;

    // Obtém o valor do rótulo "text"
    Result := xJSONDistancia.GetValue('text').Value;
  finally
    // Libera o componente IdHTTP da memória
    FreeAndNil(xIdHTTP);
    FreeAndNil(xJSONPrincipal);
  end;
end;

end.
