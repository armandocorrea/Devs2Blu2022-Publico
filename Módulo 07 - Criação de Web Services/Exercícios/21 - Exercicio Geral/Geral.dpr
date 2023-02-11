program Geral;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.Jhonson,
  Horse.BasicAuthentication,
  Horse.CORS,
  Horse.GBSwagger,
  System.SysUtils,
  UProdutos in 'Model\Entities\UProdutos.pas',
  UDadosGerais in 'Model\Services\UDadosGerais.pas',
  UController.Produtos in 'Model\Controllers\UController.Produtos.pas';

procedure SwaggerConfig;
begin
  Swagger
    .Register
      .SchemaOnError(TAPIError)
    .&End
    .Info
      .Title('API de Produtos')
      .Description('API Horse de Produtos')
      .Contact
        .Name('Armando Neto')
        .Email('email@hotmail.com')
        .URL('http://www.mypage.com.br')
      .&End
    .&End
    .BasePath('v1');
end;

procedure Registry;
begin
  THorse.Group.Prefix('v1')
    .Get('/produtos', TControllerProdutos.GetProdutos)
    .Get('/produtos/:id', TControllerProdutos.ProcurarProduto)
    .Post('/produtos', TControllerProdutos.InserirProduto)
    .Delete('/produtos/:id', TControllerProdutos.DeletarProduto);

{THorse.Group.Prefix('v2')
    .Get('/produtos', TControllerProdutos.GetProdutosV2)
    .Get('/produtos/:id', TControllerProdutos.ProcurarProduto)
    .Post('/produtos', TControllerProdutos.InserirProduto)
    .Delete('/produtos/:id', TControllerProdutos.DeletarProduto);}
end;

begin
  THorse
    .Use(Jhonson())
    .Use(CORS)
    .USE(HorseSwagger)
    .Use(HorseBasicAuthentication(
      function(const AUsername, APassword: string): Boolean
        begin
            Result := AUsername.Equals('user') and
                      APassword.Equals('password');
        end));

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  //http://localhost:9000/swagger/doc/html
  SwaggerConfig;
  THorseGBSwaggerRegister.RegisterPath(TControllerProdutos);

  Registry;

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + IntToStr(Horse.Port));
    end);
end.