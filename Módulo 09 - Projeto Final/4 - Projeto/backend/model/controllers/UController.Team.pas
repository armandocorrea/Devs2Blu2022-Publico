unit UController.Team;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  UController.Base,
  UEntity.Teams;

type
  [SwagPath('teams', 'Times')]
  TControllerTeam = class(TControllerBase)
    private
    public
      [SwagGET('Listar Times', True)]
      [SwagResponse(200, TTeam, 'Informações do Time', True)]
      [SwagResponse(404)]
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Procurar um Time')]
      [SwagParamPath('id', 'id do Time')]
      [SwagResponse(200, TTeam, 'Informações do Time')]
      [SwagResponse(404)]
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPOST('Adicionar Novo Time')]
      [SwagParamBody('Informações do Time', TTeam)]
      [SwagResponse(201)]
      [SwagResponse(400)]
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagDELETE('{id}', 'Deletar um Time')]
      [SwagParamPath('id', 'Id do Time')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

{ TControllerTeam }

uses
  UDAO.Intf,
  UDAO.Teams,
  System.JSON,
  System.SysUtils;

class procedure TControllerTeam.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOTeams.Create;
  Inherited;
end;

class procedure TControllerTeam.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOTeams.Create;
  Inherited;
end;

class procedure TControllerTeam.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOTeams.Create;
  Inherited;
end;

class procedure TControllerTeam.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOTeams.Create;
  Inherited;
end;

end.
