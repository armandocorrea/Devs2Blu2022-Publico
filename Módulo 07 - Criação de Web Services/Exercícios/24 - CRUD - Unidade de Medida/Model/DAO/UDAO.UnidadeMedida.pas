unit UDAO.UnidadeMedida;

interface

uses
  UDAO.Intf,
  System.JSON,
  DataSet.Serialize;

type
  TDAOUnidadeMedida = class(TInterfacedObject, IDAO)
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

function TDAOUnidadeMedida.AdicionarRegistro(aRegistro: TJSONObject): Boolean;
begin
  try
    Result := TUtilBanco.AdicionarRegistro('UNIDADEMEDIDA', aRegistro.ToJSON);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Adicionar Registro: ' + e.Message);
  end;
end;

function TDAOUnidadeMedida.DeletarRegistro(const aIdentificador: Integer): Boolean;
begin
  try
    Result := TUtilBanco.RemoverRegistro('UNIDADEMEDIDA', aIdentificador);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Remover Registro: ' + e.Message);
  end;
end;

function TDAOUnidadeMedida.ObterRegistros: TJSONArray;
var
  xQuery: TFDQuery;
begin
  xQuery := nil;
  try
    try
      xQuery := TUtilBanco.ExecutarConsulta('SELECT * FROM UNIDADEMEDIDA');

      Result := xQuery.ToJSONArray();
    except
      on e: Exception do
        raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

function TDAOUnidadeMedida.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xQuery: TFDQuery;
begin
  xQuery := nil;
  try
    try
      xQuery := TUtilBanco.ExecutarConsulta(
        Format('SELECT * FROM UNIDADEMEDIDA WHERE ID = %d', [aIdentificador]));

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