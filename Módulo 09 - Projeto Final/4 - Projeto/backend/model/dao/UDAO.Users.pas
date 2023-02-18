unit UDAO.Users;

interface

uses
  UDAO.Base;

type
  TDAOUsers = class(TDaoBase)
    public
      function ValidarLogin(const aUser, aPassword: String): Boolean;
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

function TDAOUsers.ValidarLogin(const aUser, aPassword: String): Boolean;
var
  xJSONArray: TJSONArray;
begin
  try
    xJSONArray := TUtilBanco.ExecutarConsulta(
      Format('SELECT * FROM %s WHERE LOGIN = %s AND PASSWORD = %s',
        [FTabela, QuotedStr(aUser), QuotedStr(aPassword)]));

    Result := Assigned(xJSONArray) and (xJSONArray.Count > 0);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Validar Usuário: ' + e.Message);
  end;
end;

end.
