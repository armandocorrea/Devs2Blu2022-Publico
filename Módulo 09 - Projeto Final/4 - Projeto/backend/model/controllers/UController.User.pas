unit UController.User;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  UController.Base,
  UEntity.Users;

type
  [SwagPath('users', 'Usuários')]
  TControllerUser = class(TControllerBase)
    private
    public
      class function ValidateUser(const aUserName, aPassWord: String): Boolean;

      [SwagGET('Listar Usuários', True)]
      [SwagResponse(200, TUser, 'Informações do Usuário', True)]
      [SwagResponse(404)]
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Procurar um Usuário')]
      [SwagParamPath('id', 'id do Usuário')]
      [SwagResponse(200, TUser, 'Informações do Usuário')]
      [SwagResponse(404)]
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPOST('Adicionar Novo Usuário')]
      [SwagParamBody('Informações do Usuário', TUser)]
      [SwagResponse(201)]
      [SwagResponse(400)]
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagDELETE('{id}', 'Deletar um Usuário')]
      [SwagParamPath('id', 'Id do Usuário')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

var
  GIdUser: Integer;

implementation

{ TControllerUser }

uses
  UDAO.Users,
  UDAO.Intf;

class procedure TControllerUser.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOUsers.Create;
  Inherited;
end;

class procedure TControllerUser.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOUsers.Create;
  Inherited;
end;

class procedure TControllerUser.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOUsers.Create;
  Inherited;
end;

class procedure TControllerUser.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOUsers.Create;
  Inherited;
end;

class function TControllerUser.ValidateUser(const aUserName,
  aPassWord: String): Boolean;
var
  xDAO: IDAO;
begin
  xDAO   := TDAOUsers.Create;

  GIdUser := TDAOUsers(xDAO).ValidarLogin(aUserName, aPassWord);

  Result := GIdUser > 0;
end;

end.
