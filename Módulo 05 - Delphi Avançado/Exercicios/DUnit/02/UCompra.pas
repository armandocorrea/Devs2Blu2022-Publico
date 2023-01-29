unit UCompra;

interface

type

  TCompra = class
    private
      FNomeProduto: String;
      FQuantidade: Double;
      FPrecoUnitario: Double;
      FValorTotal: Double;

      function GetNomeProduto: String;
      function GetQuantidade: Double;
      function GetPrecoUnitario: Double;

      procedure SetNomeProduto(const Value: String);
      procedure SetQuantidade(const Value: Double);
      procedure SetPrecoUnitario(const Value: Double);
    public
      function ValorTotalComDesconto: Double;

      property NomeProduto: String   read GetNomeProduto   write SetNomeProduto;
      property Quantidade: Double    read GetQuantidade    write SetQuantidade;
      property PrecoUnitario: Double read GetPrecoUnitario write SetPrecoUnitario;
  end;

implementation

uses
  System.SysUtils;

{ TCompra }

function TCompra.GetNomeProduto: String;
begin
  Result := FNomeProduto;
end;

function TCompra.GetQuantidade: Double;
begin
  Result := FQuantidade;
end;

function TCompra.GetPrecoUnitario: Double;
begin
  Result := FPrecoUnitario;
end;

procedure TCompra.SetNomeProduto(const Value: String);
begin
  FNomeProduto := Value;
end;

procedure TCompra.SetQuantidade(const Value: Double);
begin
  FQuantidade := Value;
end;

procedure TCompra.SetPrecoUnitario(const Value: Double);
begin
  FPrecoUnitario := Value;
end;

function TCompra.ValorTotalComDesconto: Double;
var
  xValorTotal: Double;
begin
  if Trim(NomeProduto) = EmptyStr then
    raise Exception.Create('Informar Preço Unitário para o Produto!');

  if PrecoUnitario <= 0 then
    raise Exception.Create('Informar Preço Unitário para o Produto!');

  if Quantidade <= 0 then
    raise Exception.Create('Informar Quantidade para o Produto!');

  FValorTotal := PrecoUnitario * Quantidade;

  if (Quantidade > 10) and (Quantidade <= 50) then
    FValorTotal := FValorTotal - (FValorTotal * 0.10)
  else if (Quantidade > 50) then
    FValorTotal := FValorTotal - (FValorTotal * 0.25);

  Result := FValorTotal;
end;

end.
