unit UController.Produtos;

interface

uses
  Horse;

type
  TControllerProdutos = class
    private
    public
      class procedure GetProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      class procedure GetProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      class procedure PostProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
      class procedure DeleteProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerProdutos }

uses
  UDAO.Intf, UDAO.Produtos, System.JSON, System.SysUtils;

class procedure TControllerProdutos.DeleteProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
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

  xDAO := TDAOProdutos.Create;

  if xDAO.DeletarRegistro(xId) then
    Res.Status(THTTPStatus.NoContent)
  else
    Res.Status(THTTPStatus.InternalServerError);
end;

class procedure TControllerProdutos.GetProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
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

  xDAO := TDAOProdutos.Create;

  Res.Send<TJSONObject>(xDAO.ProcurarPorId(xId));
end;

class procedure TControllerProdutos.GetProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  xDAO: IDAO;
begin
  xDAO := TDAOProdutos.Create;

  Res.Send<TJSONArray>(xDAO.ObterRegistros);
end;

class procedure TControllerProdutos.PostProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  xDAO: IDAO;
begin
  xDAO := TDAOProdutos.Create;

  if xDAO.AdicionarRegistro(Req.Body<TJSONObject>) then
    Res.Status(THTTPStatus.Created)
  else
    Res.Status(THTTPStatus.InternalServerError);
end;

end.
