program CRUD;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.Jhonson,
  Horse.Query,
  System.SysUtils,
  UController.Produtos in 'Model\Controllers\UController.Produtos.pas',
  UUtil.Banco in 'Model\Utils\UUtil.Banco.pas',
  UDAO.Intf in 'Model\DAO\UDAO.Intf.pas',
  UDAO.Produtos in 'Model\DAO\UDAO.Produtos.pas';

procedure Registry;
begin
  THorse.Group.Prefix('v1')
    .Get('/produtos', TControllerProdutos.GetProdutos)
    .Get('/produtos/:id', TControllerProdutos.GetProduto)
    .Post('/produtos', TControllerProdutos.PostProduto)
    .Delete('/produtos/:id', TControllerProdutos.DeleteProduto);
end;

begin
  THorse.Use(Jhonson);
  THorse.Use(Query); //Sempre depois do Jhonson

  Registry;

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + IntToStr(Horse.Port));
    end);
end.