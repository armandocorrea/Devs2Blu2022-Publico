unit UConcreteHandler_XML;

interface

uses
  UInterfaceHandler, DBClient;

type
  TParserXML = class(TInterfacedObject, IParser)
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
  System.SysUtils, XMLIntf, XMLDoc;

{ TParserXML }

procedure TParserXML.ProcessarInclusao(const aNomeArquivo: string; const aDataSet: TClientDataSet);
var
  FXMLDocument: IXMLDocument;
  FNodeImportacao: IXMLNode;
  xNodeDados: IXMLNode;
  xContador: Integer;
begin
  // Verifica se a extensão do arquivo é compatível com a função da classe
  if UpperCase(ExtractFileExt(aNomeArquivo)) <> '.XML' then
  begin
    // Se não houver um Parser superior, significa que a mensagem chegou ao fim da cadeia
    if not Assigned(FProximoParser) then
      raise Exception.Create('Formato desconhecido.');

    // Transfere a mensagem para o próximo Parser (Concrete Handler)
    FProximoParser.ProcessarInclusao(aNomeArquivo, aDataSet);
    Exit;
  end;

  // Carrega e abre o arquivo XML
  FXMLDocument := LoadXMLDocument(aNomeArquivo);
  FXMLDocument.Active := True;

  // Seleciona o nó principal do XML (importacao)
  FNodeImportacao := FXMLDocument.DocumentElement;

  // Executa um loop nos filhos do nó principal
  for xContador := 0 to Pred(FNodeImportacao.ChildNodes.Count) do
  begin
    // Acessa o nó filho atual
    xNodeDados := FNodeImportacao.ChildNodes[xContador];

    // Preenche o DataSet com os dados do nó
    aDataSet.Append;
    aDataSet.FieldByName('Codigo').AsString := xNodeDados.ChildNodes['codigo'].Text;
    aDataSet.FieldByName('Nome').AsString   := xNodeDados.ChildNodes['nome'].Text;
    aDataSet.FieldByName('Cidade').AsString := xNodeDados.ChildNodes['cidade'].Text;
    aDataSet.Post;
  end;
end;

procedure TParserXML.SetProximoParser(aParser: IParser);
begin
  // Atribui o próximo Parser
  FProximoParser := aParser;
end;

end.
