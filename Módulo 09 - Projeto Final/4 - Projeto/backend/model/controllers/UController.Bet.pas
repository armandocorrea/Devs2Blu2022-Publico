unit UController.Bet;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  UController.Base,
  UEntity.Bets;

type
  [SwagPath('bets', 'Palpites')]
  TControllerBet = class(TControllerBase)
    private
    public
      [SwagGET('Listar Palpites', True)]
      [SwagResponse(200, TBet, 'Informações do Palpite', True)]
      [SwagResponse(404)]
      class procedure Gets(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagGET('{id}', 'Procurar um Palpite')]
      [SwagParamPath('id', 'id do Palpite')]
      [SwagResponse(200, TBet, 'Informações do Palpite')]
      [SwagResponse(404)]
      class procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagPOST('Adicionar Novo Palpite')]
      [SwagParamBody('Informações do Palpite', TBet)]
      [SwagResponse(201)]
      [SwagResponse(400)]
      class procedure Post(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;

      [SwagDELETE('{id}', 'Deletar um Palpite')]
      [SwagParamPath('id', 'Id do Palpite')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc); override;
  end;

implementation

{ TControllerBet }

uses
  UDAO.Intf,
  UDAO.Bets,
  System.JSON,
  System.SysUtils;

class procedure TControllerBet.Delete(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOBets.Create;
  Inherited;
end;

class procedure TControllerBet.Get(Req: THorseRequest; Res: THorseResponse;
  Next: TProc);
begin
  FDAO := TDAOBets.Create;
  Inherited;
end;

class procedure TControllerBet.Gets(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOBets.Create;
  Inherited;
end;

class procedure TControllerBet.Post(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
begin
  FDAO := TDAOBets.Create;
  Inherited;
end;

end.
