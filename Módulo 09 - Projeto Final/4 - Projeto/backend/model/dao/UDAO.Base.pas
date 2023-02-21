unit UDAO.Base;

interface

uses
  UDAO.Intf,
  System.JSON,
  DataSet.Serialize;

type
  TDAOBase = class(TInterfacedObject, IDAO)
    protected
      FTabela: String;
    public
      function ObterRegistros: TJSONArray; virtual;
      function ProcurarPorId(const aIdentificador: Integer): TJSONObject; virtual;
      function AdicionarRegistro(aRegistro: TJSONObject): Boolean;
      function DeletarRegistro(const aIdentificador: Integer): Boolean;
    end;

implementation

uses
  FireDAC.Comp.Client,
  System.SysUtils,
  UUtil.Banco;

{ TDAOBase }

function TDAOBase.AdicionarRegistro(aRegistro: TJSONObject): Boolean;
begin
  try
    Result := TUtilBanco.AdicionarRegistro(FTabela, aRegistro.ToJSON);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Adicionar Registro: '
        + e.Message);
  end;
end;

function TDAOBase.DeletarRegistro(const aIdentificador: Integer): Boolean;
begin
  try
    Result := TUtilBanco.RemoverRegistro(FTabela, aIdentificador);
  except
    on e: Exception do
      raise Exception.Create('Erro ao Remover Registro: ' + e.Message);
  end;
end;

function TDAOBase.ObterRegistros: TJSONArray;
begin
  try
    Result := TUtilBanco.ExecutarConsulta(Format('SELECT * FROM %s',
      [FTabela]));
  except
    on e: Exception do
      raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
  end;
end;

function TDAOBase.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONArray: TJSONArray;
begin
  try
    xJSONArray := TUtilBanco.ExecutarConsulta(
                    Format('SELECT * FROM %s WHERE ID = %d',
                      [FTabela, aIdentificador]));

    if xJSONArray.Count = 0 then
    begin
      Result := TJSONObject.Create;
      xJSONArray.Free;
      Exit;
    end;

    Result := TJSONObject.ParseJSONValue(
      TEncoding.ASCII.GetBytes(
        xJSONArray[0].ToJSON), 0) as TJSONObject;
  except
    on e: Exception do
      raise Exception.Create('Erro ao Obter Registros: ' + e.Message);
  end;
end;

end.
