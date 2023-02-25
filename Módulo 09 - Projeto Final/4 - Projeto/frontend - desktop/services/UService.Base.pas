unit UService.Base;

interface

uses
  UService.Intf, REST.Client, REST.Types;

type
  TServiceBase = class(TInterfacedObject, IService)
    private
      FToken: String;
    protected
      FRESTClient: TRESTClient;
      FRESTRequest: TRESTRequest;
      FRESTResponse: TRESTResponse;

      procedure CarregarToken;

      procedure Registrar; virtual; abstract;
      procedure Listar; virtual; abstract;
      procedure Excluir; virtual; abstract;

      function ObterRegistro(const aId: Integer): TObject; virtual; abstract;
    public
      constructor Create;
      destructor  Destroy; override;
  end;

implementation

uses
  System.Classes, System.SysUtils, Winapi.Windows;

{ TServiceBase }

procedure TServiceBase.CarregarToken;
var
  xMeuArquivo: THandle;
  xStringList: TStringList;
const
  NOME_ARQUIVO = 'Token.jwt';
begin
  FToken      := EmptyStr;
  xStringList := TStringList.Create;
  try
    if not FileExists(NOME_ARQUIVO) then
    begin
      xMeuArquivo := FileCreate(NOME_ARQUIVO);
      if xMeuArquivo <> INVALID_HANDLE_VALUE  then
        FileClose(xMeuArquivo);
    end;

    xStringList.LoadFromFile(NOME_ARQUIVO);

    if xStringList.Count > 0 then
      FToken := xStringList[0];
  finally
    xStringList.Free;
  end;
end;

constructor TServiceBase.Create;
begin
  Self.CarregarToken;

  FRESTClient   := TRESTClient.Create(nil);
  FRESTRequest  := TRESTRequest.Create(nil);
  FRESTResponse := TRESTResponse.Create(nil);

  FRESTRequest.Accept   := 'application/json';
  FRESTRequest.Client   := FRESTClient;
  FRESTRequest.Response := FRESTResponse;
  FRESTRequest.Params.Clear;

  FRESTRequest.Params.AddHeader('Authorization',
      Format('Bearer %s', [FToken]));
  FRESTRequest.Params.ParameterByName('Authorization').Options := [poDoNotEncode];
end;

destructor TServiceBase.Destroy;
begin
  FreeAndNil(FRESTClient);
  FreeAndNil(FRESTRequest);
  FreeAndNil(FRESTResponse);

  inherited;
end;

end.
