unit UDAO.Users;

interface

uses
  UDAO.Base;

type
  TDAOUsers = class(TDaoBase)
    public
      function ValidarLogin(const aUser, aPassword: String): Integer;
      constructor Create;
  end;

implementation

uses
  System.JSON, UUtil.Banco, System.SysUtils;

{ TDAOUsers }

constructor TDAOUsers.Create;
begin
  FTabela := 'users';
end;

function TDAOUsers.ValidarLogin(const aUser, aPassword: String): Integer;
var
  xJSONArray: TJSONArray;
begin
  Result := 0;
  try
    xJSONArray := TUtilBanco.ExecutarConsulta(
      Format('SELECT * FROM %s WHERE LOGIN = %s AND PASSWORD = %s',
        [FTabela, QuotedStr(aUser), QuotedStr(aPassword)]));

    if Assigned(xJSONArray) and (xJSONArray.Count > 0) then
      Result := StrToIntDef(xJSONArray[0].FindValue('id').Value,0);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Validar Usuário: ' + e.Message);
  end;
end;

end.
