unit UConcreteClassRepositories;

interface

uses UAbstractClass;

type
  TConcreteClassRepositories = class(TAbstractClass)
  protected
    function ProcessarRetorno: olevariant; override;
  public
    constructor Create(const aParametro: String);
  end;

implementation

uses
  System.SysUtils, System.JSON, Data.DB, Datasnap.DBClient;

{ TConcreteClassRepositories }

constructor TConcreteClassRepositories.Create(const aParametro: String);
begin
  // Configura os parâmetros referente à consulta de repositórios
  FParametros := Format('repositories?q=%s&page=1&per_page=100', [aParametro]);
end;

function TConcreteClassRepositories.ProcessarRetorno: olevariant;
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
    xDataSetRetorno.FieldDefs.Add('Nome', ftString, 40);
    xDataSetRetorno.FieldDefs.Add('Linguagem', ftString, 18);
    xDataSetRetorno.FieldDefs.Add('Observadores', ftInteger);
    xDataSetRetorno.CreateDataSet;

    // Percorre o JSON, lendo os valores das chaves
    for xJSONValue in FJSON.GetValue('items') as TJSONArray do
    begin
      xJSONObject := xJSONValue as TJSONObject;

      xDataSetRetorno.AppendRecord([
        xJSONObject.GetValue('id').Value,
        xJSONObject.GetValue('full_name').Value,
        xJSONObject.GetValue('language').Value,
        xJSONObject.GetValue('watchers').Value
      ]);
    end;

    // Devolve os dados tabulados
    Result := xDataSetRetorno.Data;
  finally
    xDataSetRetorno.Free;
  end;
end;

end.
