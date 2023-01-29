unit UWebServiceViaCEP;

interface

uses
  Xml.XMLIntf, Xml.XMLDoc, UInterfaceViaCEP;

type
  TWebServiceViaCEP = class(TInterfacedObject, IWebServiceViaCEP)
    private
      FXMLDocument: IXMLDocument;
    public
      constructor Create;
      destructor Destroy; override;

      procedure ConsultarEnderecoWebService(const aCep: String);
      function ObterLogradouro: String;
      function ObterBairro: String;
      function ObterCidade: String;
  end;

implementation

uses
  System.SysUtils, System.Variants;

{ TWebServiceViaCEP }

procedure TWebServiceViaCEP.ConsultarEnderecoWebService(const aCep: String);
begin
  FXMLDocument.FileName := Format('https://viacep.com.br/ws/%s/xml/', [aCep]);
  FXMLDocument.Active   := True;
end;

constructor TWebServiceViaCEP.Create;
begin
  FXMLDocument := TXMLDocument.Create(nil);
end;

destructor TWebServiceViaCEP.Destroy;
begin
  FXMLDocument := nil;
  inherited;
end;

function TWebServiceViaCEP.ObterBairro: String;
begin
  Result := VarToStr(FXMLDocument.DocumentElement.ChildValues['bairro']);
end;

function TWebServiceViaCEP.ObterCidade: String;
begin
  Result := VarToStr(FXMLDocument.DocumentElement.ChildValues['localidade']);
end;

function TWebServiceViaCEP.ObterLogradouro: String;
begin
  Result := VarToStr(FXMLDocument.DocumentElement.ChildValues['logradouro']);
end;

end.
