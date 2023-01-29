unit UAdapter;

interface

uses
  UInterfaceViaCEP, UAdaptee;

type
  TAdapter = class(TInterfacedObject, IWebServiceViaCEP)
  private
    FWebServiceCorreios: TWebServiceCorreios;
  public
    constructor Create(aWebServiceCorreios: TWebServiceCorreios);
    procedure ConsultarEnderecoWebService(const aCep: string);
    function ObterLogradouro: string;
    function ObterBairro: string;
    function ObterCidade: string;
  end;

implementation

{ TAdapter }

procedure TAdapter.ConsultarEnderecoWebService(const aCep: string);
begin
  FWebServiceCorreios.DefinirParametrosConsulta(aCep);
  FWebServiceCorreios.ConsultarCEP;
end;

constructor TAdapter.Create(aWebServiceCorreios: TWebServiceCorreios);
begin
  FWebServiceCorreios := aWebServiceCorreios;
end;

function TAdapter.ObterBairro: string;
begin
  Result := FWebServiceCorreios.ObterResposta('Bairro');
end;

function TAdapter.ObterCidade: string;
begin
  Result := FWebServiceCorreios.ObterResposta('Cidade');
end;

function TAdapter.ObterLogradouro: string;
begin
  Result := FWebServiceCorreios.ObterResposta('Logradouro');
end;

end.
