unit UUtil.Banco;

interface

uses
  FireDac.Comp.Client,
  FireDAC.Phys.MySQL,
  FireDac.DApt,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  Data.DB,
  DataSet.Serialize,
  System.JSON,
  System.SysUtils;

type
  TUtilBanco = class
    private
      class var FConexao: TFDConnection;

      class procedure AbrirConexao;
      class procedure FecharConexao;
    public
      class function ExecutarConsulta(const aSQL: String): TJSONArray;
      class function AdicionarRegistro(const aTabela: String; const aJSON: String): Boolean;
      class function RemoverRegistro(const aTabela: String; const aIdentificador: Integer): Boolean;
  end;

implementation

{ TUtilBanco }

class procedure TUtilBanco.AbrirConexao;
var
  xDriver: TFDPhysMySQLDriverLink;
begin
  xDriver := TFDPhysMySQLDriverLink.Create(nil);
  FConexao  := TFDConnection.Create(nil);

  //Driver de Conexão do MySQL
  xDriver.VendorLib := ExtractFilePath(ParamStr(0)) + 'libmysql.dll';

  //Parâmetros de Configuração do banco
  FConexao.DriverName  := 'MySQL';
  FConexao.LoginPrompt := False;
  FConexao.Params.Add('Database=devsbets');
  FConexao.Params.Add('User_Name=root');
  FConexao.Params.Add('Password=root');
  FConexao.Params.Add('Server=localhost');
  FConexao.Params.Add('DriverID=MySQL');
  FConexao.Open;
end;

class function TUtilBanco.AdicionarRegistro(const aTabela: String; const aJSON: String): Boolean;
const
  COMANDO_INSERT = 'INSERT INTO %s (%s) VALUES (%s)';
var
  I: Integer;
  xMemTable: TFDMemTable;
  xQuery: TFDQuery;
  xJSONArray: TJSONArray;
  xColunas: String;
  xValores: String;
begin
  xQuery    := TFDQuery.Create(nil);
  xMemTable := TFDMemTable.Create(nil);
  try
    try
      xMemTable.LoadFromJSON(aJSON);

      for I := 0 to Pred(xMemTable.FieldCount) do
      begin
        xColunas := xColunas + xMemTable.Fields[I].FieldName + ',';

        if xMemTable.Fields[I].DataType = ftFloat then
          xValores := xValores +
            StringReplace(FloatToStr(xMemTable.Fields[I].AsFloat), ',', '.', [rfReplaceAll]) + ','
        else
          xValores := xValores + QuotedStr(xMemTable.Fields[I].AsString) + ',';
      end;

      xColunas := Copy(xColunas, 1, Length(xColunas)-1);
      xValores := Copy(xValores, 1, Length(xValores)-1);

      Self.AbrirConexao;
      xQuery.Connection := FConexao;
      xQuery.SQL.Clear;
      xQuery.SQL.Add(Format(COMANDO_INSERT, [aTabela, xColunas, xValores]));
      xQuery.ExecSQL;
      Self.FecharConexao;

      Result := True;
    except
      on e: Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    FreeAndNil(xQuery);
    FreeAndNil(xMemTable);
  end;
end;

class function TUtilBanco.ExecutarConsulta(const aSQL: String): TJSONArray;
var
  xQuery: TFDQuery;
begin
  xQuery := TFDQuery.Create(nil);
  try
    Self.AbrirConexao;
    xQuery.Connection := FConexao;
    xQuery.Open(aSQL);

    Result := xQuery.ToJSONArray();
    Self.FecharConexao;
  except
    on e: Exception do
      raise Exception.Create(e.Message);
  end;
end;

class procedure TUtilBanco.FecharConexao;
begin
  if Assigned(FConexao) and (FConexao.Connected) then
  begin
    FConexao.Close;
    FreeAndNil(FConexao);
  end;
end;

class function TUtilBanco.RemoverRegistro(const aTabela: String;
  const aIdentificador: Integer): Boolean;
const
  COMANDO_DELETE = 'DELETE FROM %s WHERE ID = %d';
var
  xQuery: TFDQuery;
begin
  xQuery := TFDQuery.Create(nil);
  try
    try
      Self.AbrirConexao;
      xQuery.Connection := FConexao;
      xQuery.SQL.Clear;
      xQuery.SQL.Add(Format(COMANDO_DELETE, [aTabela, aIdentificador]));
      xQuery.ExecSQL;
      Self.FecharConexao;

      Result := True;
    except
      on e: Exception do
        raise Exception.Create(e.Message);
    end;
  finally
    FreeAndNil(xQuery);
  end;
end;

end.
