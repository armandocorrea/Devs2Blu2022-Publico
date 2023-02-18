unit UController.UnidadeMedida;

interface

uses
  Horse;

type
  TControllerUnidadeMedida = class
    private
    public
      class procedure GetUnidades(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      class procedure GetUnidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      class procedure PostUnidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      class procedure DeleteUnidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerUnidadeMedida }

uses
  UDAO.Intf,
  UDAO.UnidadeMedida,
  System.JSON,
  System.SysUtils;

class procedure TControllerUnidadeMedida.DeleteUnidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  xDAO: IDAO;
  xId: Integer;
begin
  if (Req.Params.Count <> 1) or (not(Req.Params.ContainsKey('id'))) then
  begin
    Res.Status(THTTPStatus.BadRequest);
    Exit;
  end;

  xId := StrToIntDef(Req.Params.Items['id'], 0);

  xDAO := TDAOUnidadeMedida.Create;

  if xDAO.DeletarRegistro(xId) then
    Res.Status(THTTPStatus.NoContent)
  else
    Res.Status(THTTPStatus.InternalServerError);
end;

class procedure TControllerUnidadeMedida.GetUnidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  xDAO: IDAO;
  xId: Integer;
begin
  if (Req.Params.Count <> 1) or (not(Req.Params.ContainsKey('id'))) then
  begin
    Res.Status(THTTPStatus.BadRequest);
    Exit;
  end;

  xId := StrToIntDef(Req.Params.Items['id'], 0);

  xDAO := TDAOUnidadeMedida.Create;

  Res.Send<TJSONObject>(xDAO.ProcurarPorId(xId));
end;

class procedure TControllerUnidadeMedida.GetUnidades(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  xDAO: IDAO;
begin
  xDAO := TDAOUnidadeMedida.Create;

  Res.Send<TJSONArray>(xDAO.ObterRegistros);
end;

class procedure TControllerUnidadeMedida.PostUnidade(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  xDAO: IDAO;
  xMensagem: TJSONArray;
begin
  xDAO := TDAOUnidadeMedida.Create;

  if xDAO.AdicionarRegistro(Req.Body<TJSONObject>) then
    Res.Status(THTTPStatus.Created)
  else
    Res.Status(THTTPStatus.BadRequest);
end;

end.
