unit UController.Cargo;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  UCargo;

type
  [SwagPath('cargo', 'Cargos')]
  TCargoController = class
    private
    public
      [SwagGET('Listar Cargos', True)]
      [SwagParamQuery('id', 'Id do Cargo', False, True)]
      [SwagParamQuery('descricao', 'Descrição do Cargo')]
      [SwagResponse(200, TCargo, 'Informações do Cargo', True)]
      class procedure GetOffices(Req: THorseRequest; Res: THorseResponse; Next: TProc);

      [SwagGET('{id}', 'Procurar um Cargo')]
      [SwagParamPath('id', 'id do Cargo')]
      [SwagResponse(200, TCargo, 'Informações do Cargo')]
      [SwagResponse(404)]
      class procedure FindOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);

      [SwagPOST('Adicionar Novo Cargo')]
      [SwagParamBody('Informações do Cargo', TCargo)]
      [SwagResponse(201, TCargo)]
      [SwagResponse(400)]
      class procedure InsertOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);

      [SwagPUT('{id}', 'Atualizar um Cargo')]
      [SwagParamPath('id', 'Id do Cargo')]
      [SwagParamBody('Informações do Cargo', TCargo)]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure UpdateOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);

      [SwagDELETE('{id}', 'Deletar um Cargo')]
      [SwagParamPath('id', 'Id do Cargo')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure DeleteOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

class procedure TCargoController.DeleteOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Status(THTTPStatus.NoContent);
end;

class procedure TCargoController.FindOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Send('{"id": 1, "descricao": "Desenvolvedor Júnior"}');
end;

class procedure TCargoController.GetOffices(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Send('[{"id": 1, "nome": "Desenvolvedor Júnior"}]');
end;

class procedure TCargoController.InsertOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Send(Req.Body).Status(THTTPStatus.Created);
end;

class procedure TCargoController.UpdateOffice(Req: THorseRequest; Res: THorseResponse; Next: TProc);
begin
  Res.Status(THTTPStatus.NoContent);
end;

end.
