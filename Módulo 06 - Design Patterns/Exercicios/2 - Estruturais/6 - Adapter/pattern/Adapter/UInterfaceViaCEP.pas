unit UInterfaceViaCEP;

interface

type
  IWebServiceViaCEP = interface
    ['{742BDA4E-8C18-49F3-8D20-CADEAB2674ED}']
    procedure ConsultarEnderecoWebService(const aCep: String);
    function ObterLogradouro: String;
    function ObterBairro: String;
    function ObterCidade: String;
  end;

implementation

end.
