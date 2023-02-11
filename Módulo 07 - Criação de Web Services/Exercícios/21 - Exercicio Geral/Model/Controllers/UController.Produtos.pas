unit UController.Produtos;

interface

uses
  Horse,
  GBSwagger.Path.Attributes,
  System.SysUtils,
  System.JSON,
  UProdutos;

type
  [SwagPath('produto', 'Produtos')]
  TControllerProdutos = class
    private
    public
      [SwagGET('Listar Produtos', True)]
      [SwagParamQuery('id', 'id do produto')]
      [SwagResponse(200, TProduto, 'Informações do Produto', True)]
      class procedure GetProdutos(Req: THorseRequest; Res: THorseResponse; Next: TProc);

      [SwagGET('{id}', 'Procurar um Produto')]
      [SwagParamPath('id', 'id do produto')]
      [SwagResponse(200, TProduto, 'Informações da Produto')]
      [SwagResponse(404)]
      class procedure ProcurarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);

      [SwagPOST('Adicionar Novo Produto')]
      [SwagParamBody('Informações do Produto', TProduto)]
      [SwagResponse(201, TProduto)]
      [SwagResponse(400)]
      class procedure InserirProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);

      [SwagDELETE('{id}', 'Deletar um Produto')]
      [SwagParamPath('id', 'Id do Produto')]
      [SwagResponse(204)]
      [SwagResponse(400)]
      [SwagResponse(404)]
      class procedure DeletarProduto(Req: THorseRequest; Res: THorseResponse; Next: TProc);
  end;

implementation

{ TControllerProdutos }

uses UDadosGerais;

class procedure TControllerProdutos.DeletarProduto(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  xId: Integer;
  xDadosPessoas: TDadosGerais;
begin
  xDadosPessoas := TDadosGerais.Create('Produtos.json');
  try
    xId := Req.Params.Items['id'].ToInteger;

    if xDadosPessoas.RemoverRegistro(xId) then
      Res.Status(THTTPStatus.NoContent)
    else
      Res.Status(THTTPStatus.InternalServerError);
  finally
    xDadosPessoas.Free;
  end;
end;

class procedure TControllerProdutos.GetProdutos(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  xDadosPessoas: TDadosGerais;
begin
  xDadosPessoas := TDadosGerais.Create('Produtos.json');
  try
    Res.Send<TJSONArray>(xDadosPessoas.JSON);
  finally
    xDadosPessoas.Free;
  end;
end;

class procedure TControllerProdutos.InserirProduto(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  xDadosPessoas: TDadosGerais;
begin
  xDadosPessoas := TDadosGerais.Create('Produtos.json');
  try
    if xDadosPessoas.AdicionarRegistro(Req.Body<TJSONObject>) then
      Res.Status(THTTPStatus.OK)
    else
      Res.Status(THTTPStatus.InternalServerError);
  finally
    xDadosPessoas.Free;
  end;
end;

class procedure TControllerProdutos.ProcurarProduto(Req: THorseRequest;
  Res: THorseResponse; Next: TProc);
var
  xId: Integer;
  xDadosPessoas: TDadosGerais;
begin
  xDadosPessoas := TDadosGerais.Create('Produtos.json');
  try
    xId := Req.Params.Items['id'].ToInteger;

    Res.Send<TJSONObject>(xDadosPessoas.ProcurarRegistro(xId));
  finally
    xDadosPessoas.Free;
  end;
end;

end.
