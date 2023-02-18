unit UDAO.Produtos;

interface

uses
  UDAO.Intf,
  System.JSON,
  DataSet.Serialize;

type
  TDAOProdutos = class(TInterfacedObject, IDAO)
    function ObterRegistros: TJSONArray;
    function ProcurarPorId(const aIdentificador: Integer): TJSONObject;
    function AdicionarRegistro(aRegistro: TJSONObject): Boolean;
    function DeletarRegistro(const aIdentificador: Integer): Boolean;
  end;

implementation

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  UUtil.Banco;

{ TDAOProdutos }

function TDAOProdutos.AdicionarRegistro(aRegistro: TJSONObject): Boolean;
begin
  try
    Result := TUtilBanco.AdicionarRegistro('PRODUTOS', aRegistro.ToJSON);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Adicionar Registro: ' + e.Message);
  end;
end;

function TDAOProdutos.DeletarRegistro(const aIdentificador: Integer): Boolean;
begin
  try
    Result := TUtilBanco.RemoverRegistro('PRODUTOS', aIdentificador);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Remover Registro: ' + e.Message);
  end;
end;

function TDAOProdutos.ObterRegistros: TJSONArray;
var
  xQuery: TFDQuery;
begin
  xQuery := nil;
  try
    try
      xQuery := TUtilBanco.ExecutarConsulta('SELECT * FROM PRODUTOS');

      Result := xQuery.ToJSONArray();
      //ToJSONArray e LoadFromToJSON - DataSet.Serialize
    except
      on e: Exception do
        raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

function TDAOProdutos.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xQuery: TFDQuery;
begin
  xQuery := nil;
  try
    try
      xQuery := TUtilBanco.ExecutarConsulta(
        Format('SELECT * FROM PRODUTOS WHERE ID = %d', [aIdentificador]));

      Result := xQuery.ToJSONObject();
    except
      on e: Exception do
        raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

end.
