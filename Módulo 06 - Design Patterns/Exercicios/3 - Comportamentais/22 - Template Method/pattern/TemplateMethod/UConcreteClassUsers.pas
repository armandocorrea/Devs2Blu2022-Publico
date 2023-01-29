unit UConcreteClassUsers;

interface

uses UAbstractClass;

type
  TConcreteClassUsers = class(TAbstractClass)
  protected
    function ProcessarRetorno: olevariant; override;
  public
    constructor Create(const aParametro: string);
  end;

implementation

uses
  System.SysUtils, System.JSON, Data.DB, Datasnap.DBClient;

{ TConcreteClassUsers }

constructor TConcreteClassUsers.Create(const aParametro: string);
begin
  // Configura os parâmetros referente à consulta de usuários
  FParametros := Format('users?q=%s&page=1&per_page=100', [aParametro]);
end;

function TConcreteClassUsers.ProcessarRetorno: olevariant;
var
  xDataSetRetorno: TClientDataSet;
  xJSONValue: TJSONValue;
  xJSONObject: TJSONObject;
begin
  // Cria um DataSet para tabular os dados consultados
  xDataSetRetorno := TClientDataSet.Create(nil);
  try
    // Define as colunas
    xDataSetRetorno.FieldDefs.Add('ID', ftInteger);
    xDataSetRetorno.FieldDefs.Add('Login', ftString, 25);
    xDataSetRetorno.FieldDefs.Add('URL', ftString, 40);
    xDataSetRetorno.FieldDefs.Add('Score', ftFloat);
    xDataSetRetorno.CreateDataSet;

    // Percorre o JSON, lendo os valores das chaves
    for xJSONValue in FJSON.GetValue('items') as TJSONArray do
    begin
      xJSONObject := xJSONValue as TJSONObject;

      xDataSetRetorno.AppendRecord([
        xJSONObject.GetValue('id').Value,
        xJSONObject.GetValue('login').Value,
        xJSONObject.GetValue('html_url').Value,
        xJSONObject.GetValue('score').Value
      ]);
    end;

    // Devolve os dados tabulados
    Result := xDataSetRetorno.Data;
  finally
    xDataSetRetorno.Free;
  end;
end;

end.
