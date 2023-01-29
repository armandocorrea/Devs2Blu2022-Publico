unit UAdaptee;

interface

uses UWebServiceCorreios, System.Classes;

type
  TWebServiceCorreios = class
  private
    FParametros: consultaCEP;
    FResposta: enderecoERP;

    procedure BeforeExecute(const aMethodName: string; aSOAPRequest: TStream);
  public
    destructor Destroy; override;
    procedure DefinirParametrosConsulta(const aCep: string);
    procedure ConsultarCEP;
    function ObterResposta(const aInformacao: string): string;
  end;

implementation

uses
  Soap.SOAPHTTPClient, System.SysUtils;

{ TWebServiceCorreios }

procedure TWebServiceCorreios.BeforeExecute(const aMethodName: string; aSOAPRequest: TStream);
var
  xRequest: TStringList;
begin
  // sobrescreve a requisição SOAP para deixá-la de acordo com a estrutura
  // exigida pelo WebService

  xRequest := TStringList.Create;
  try
    xRequest.Text :=
      '<soapenv:Envelope xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:cli="http://cliente.bean.master.sigep.bsb.correios.com.br/">' +
      '  <soapenv:Header/>' +
      '    <soapenv:Body>' +
      '      <cli:consultaCEP>' +
      '        <cep>' + FParametros.cep + '</cep>' +
      '      </cli:consultaCEP>' +
      '    </soapenv:Body>' +
      '</soapenv:Envelope>';

    aSOAPRequest.Position := 0;
    aSOAPRequest.Size := Length(xRequest.Text);
    xRequest.SaveToStream(aSOAPRequest);
  finally
    FreeAndNil(xRequest);
  end;
end;

procedure TWebServiceCorreios.ConsultarCEP;
var
  xCorreios: AtendeCliente;
  xHTTPRIO: THTTPRIO;
begin
  xHTTPRIO  := THTTPRIO.Create(nil);
  xHTTPRIO.OnBeforeExecute := Self.BeforeExecute;

  xCorreios := GetAtendeCliente(True, '', xHTTPRIO);
  FResposta := xCorreios.consultaCEP(FParametros).return;
end;

procedure TWebServiceCorreios.DefinirParametrosConsulta(const aCep: string);
begin
  FParametros := consultaCEP.Create;
  FParametros.cep := aCep;
end;

destructor TWebServiceCorreios.Destroy;
begin
  FreeAndNil(FParametros);
  FreeAndNil(FResposta);
  inherited;
end;

function TWebServiceCorreios.ObterResposta(const aInformacao: string): string;
begin
  Result := EmptyStr;

  if aInformacao = 'Logradouro' then
    Result := FResposta.end_
  else if aInformacao = 'Bairro' then
    Result := FResposta.bairro
  else if aInformacao = 'Cidade' then
    Result := FResposta.cidade;
end;

end.
