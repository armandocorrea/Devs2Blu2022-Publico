unit UService.User;

interface

uses
  UEntity.Users, UService.Base;

type
  TServiceUser = class(TServiceBase)
    private
      FUser: TUser;
    public
      constructor Create; overload;
      constructor Create(aUser: TUser); overload;
      destructor  Destroy; override;

      procedure Registrar; override;
      procedure Listar; override;
      procedure Excluir; override;

      function ObterRegistro(const aId: Integer): TObject; override;
  end;

implementation

uses
  REST.Types,
  System.JSON, UUtils.Constants, System.SysUtils,
  System.Classes, FireDAC.comp.Client, DataSet.Serialize;

{ TServiceUser }

constructor TServiceUser.Create;
begin
  Inherited Create;
end;

constructor TServiceUser.Create(aUser: TUser);
begin
  FUser := aUser;

  Self.Create;
end;

destructor TServiceUser.Destroy;
begin
  FreeAndNil(FUser);
  inherited;
end;

procedure TServiceUser.Excluir;
begin
  //Método sem implementação no momento
end;

procedure TServiceUser.Listar;
begin
  //Método sem implementação no momento
end;

function TServiceUser.ObterRegistro(const aId: Integer): TObject;
var
  xMemTable: TFDMemTable;
begin
  Result := nil;

  xMemTable := TFDMemTable.Create(nil);

  try
    FRESTClient.BaseURL := URL_BASE_USER + '/' + aId.ToString;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    if FRESTResponse.StatusCode = API_SUCESSO then
    begin
      xMemTable.LoadFromJSON(FRESTResponse.Content);

      if xMemTable.FindFirst then
        Result := TUser.Create(xMemTable.FieldByName('id').AsInteger);
    end;
  finally
    FreeAndNil(xMemTable);
  end;
end;

procedure TServiceUser.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_USER;
    FRESTRequest.Method := rmPost;
    FRESTRequest.Params.AddBody(FUser.JSON);
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_CRIADO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

end.
