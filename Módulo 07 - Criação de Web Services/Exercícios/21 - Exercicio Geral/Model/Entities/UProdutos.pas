unit UProdutos;

interface

uses
  GBSwagger.Model.Attributes;

type
  TProduto = class
    private
      FId: Integer;
      FDescricao: String;
      FUnidadeMedida: String;
      FValorVenda: Double;

      function GetDescricao: String;
      function GetId: Integer;
      function GetUnidadeMedida: String;
      function GetValorVenda: Double;

      procedure SetDescricao(const Value: String);
      procedure SetId(const Value: Integer);
      procedure SetUnidadeMedida(const Value: String);
      procedure SetValorVenda(const Value: Double);
    public
      [SwagProp('Produto Id', True)]
      property ID: Integer read GetId write SetId;

      [SwagProp('Produto Descricao', True)]
      property Descricao: String read GetDescricao write SetDescricao;

      [SwagProp('Produto Unidade Medida', True)]
      property UnidadeMedida: String read GetUnidadeMedida write SetUnidadeMedida;

      [SwagProp('Produto Valor de Venda', True)]
      property ValorVenda: Double read GetValorVenda write SetValorVenda;
  end;

  TAPIError = class
    private
      FError: String;
    public
      property Error: String read FError write FError;
  end;

implementation

{ TProduto }

function TProduto.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TProduto.GetId: Integer;
begin
  Result := FId;
end;

function TProduto.GetUnidadeMedida: String;
begin
  Result := FUnidadeMedida;
end;

function TProduto.GetValorVenda: Double;
begin
  Result := FValorVenda;
end;

procedure TProduto.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TProduto.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TProduto.SetUnidadeMedida(const Value: String);
begin
  FUnidadeMedida := Value;
end;

procedure TProduto.SetValorVenda(const Value: Double);
begin
  FValorVenda := Value;
end;

end.
