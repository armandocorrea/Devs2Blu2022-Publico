unit UConcreteHandler_CSV;

interface

uses
  UInterfaceHandler, DBClient;

type
  TParserCSV = class(TInterfacedObject, IParser)
  private
    // Referência para o Concrete Handler superior
    FProximoParser: IParser;
  public
    // Atribui a referência do Concrete Handler superior
    procedure SetProximoParser(aParser: IParser);

    // Método para processar a inclusão de dados no DataSet
    procedure ProcessarInclusao(const aNomeArquivo: string; const aDataSet: TClientDataSet);
  end;

implementation

uses
  System.Classes, System.SysUtils;

{ TParserCSV }

procedure TParserCSV.ProcessarInclusao(const aNomeArquivo: string; const aDataSet: TClientDataSet);
var
  xValores: TStringList;
  xLinha: TStringList;
  xContador: Integer;
begin
  // Verifica se a extensão do arquivo é compatível com a função da classe
  if UpperCase(ExtractFileExt(aNomeArquivo)) <> '.CSV' then
  begin
    // Se não houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(FProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o próximo Parser (Concrete Handler)
    FProximoParser.ProcessarInclusao(aNomeArquivo, aDataSet);
    Exit;
  end;

  // Cria a TStringList que irá carregar o arquivo selecionado
  xValores := TStringList.Create;

  // Cria a TStringList que receberá os valores de cada linha
  xLinha := TStringList.Create;
  try
    // Carrega o arquivo
    xValores.LoadFromFile(aNomeArquivo);

    // Executa um loop nos itens da TStringList
    for xContador := 0 to Pred(xValores.Count) do
    begin
      xLinha.Clear;

      // Utiliza o ExtractStrings para quebrar os valores
      // que estão separados por vírgula
      ExtractStrings([','], [' '], PChar(xValores[xContador]), xLinha);

      // Preenche o DataSet com os dados da linha
      aDataSet.AppendRecord([xLinha[0], xLinha[1], xLinha[2]]);
    end;
  finally
    // Libera as variáveis da memória
    FreeAndNil(xLinha);
    FreeAndNil(xValores);
  end;
end;

procedure TParserCSV.SetProximoParser(aParser: IParser);
begin
  // Atribui o próximo Parser
  FProximoParser := aParser;
end;

end.
