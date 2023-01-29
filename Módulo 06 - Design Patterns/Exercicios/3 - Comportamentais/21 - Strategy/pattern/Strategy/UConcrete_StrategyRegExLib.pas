unit UConcrete_StrategyRegExLib;

interface

uses UInterface_Strategy;

type
  TConcreteStrategyRegExLib = class(TInterfacedObject, IStrategy)
    private
      //Acessa o WebService para consultar a expressão regular
      function ObterExpressao: String;
    public
      //Assinatura da Interface Strategy
      function ValidarEmail(const aEmail: String): Boolean;
  end;

implementation

{ TConcreteStrategyRegExLib }

uses WebService.RegExLib, Soap.SOAPHTTPClient, RegularExpressions;

function TConcreteStrategyRegExLib.ObterExpressao: String;
var
  xWebServiceRegExLib: WebservicesSoap;
  xHTTPRIO: THTTPRIO;
  xExpressao: RegExpDetails;
begin
  // Cria um objeto da classe THTTPRIO
  xHTTPRIO := THTTPRIO.Create(nil);

  // Obtém uma instância do consumidor do WebService
  xWebServiceRegExLib := GetWebservicesSoap(True, '', xHTTPRIO);

  // Consulta os dados da expressão regular (o ID 3122 corresponde a uma validação de e-mail)
  xExpressao := xWebServiceRegExLib.getRegExpDetails(3122);

  // Obtém a string referente à expressão regular
  Result := xExpressao.regular_expression;

  // Libera o objeto da memória
  xExpressao.Free;
end;

function TConcreteStrategyRegExLib.ValidarEmail(const aEmail: String): Boolean;
var
  xRegEx: TRegEx;
begin
  // Cria uma instância do record TRegEx informando a expressão consultada no WebService
  xRegEx := TRegEx.Create(ObterExpressao);

  // Valida o e-mail com a expressão regular
  Result := xRegEx.Match(aEmail).Success;
end;

end.
