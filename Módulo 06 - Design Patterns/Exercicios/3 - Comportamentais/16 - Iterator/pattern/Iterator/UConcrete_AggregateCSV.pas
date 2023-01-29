unit UConcrete_AggregateCSV;

interface

uses UInterface_Aggregate, Contnrs, UInterface_Iterator;

type
  TConcreteAggregateCSV = class(TInterfacedObject, IAggregate)
    private
      FLista: TObjectList;

      procedure PreencherLista(const aCaminhoArquivo: String);
    public
      constructor Create(const aCaminhoArquivo: String);
      destructor Destroy; override;

      function GetLista: TObjectList;
      function GetIterator: IIterator;
  end;

implementation

{ TConcreteAggregateCSV }

uses UCliente, UConcrete_Iterator, System.Classes, System.SysUtils;

constructor TConcreteAggregateCSV.Create(const aCaminhoArquivo: String);
begin
  //Cria a lista de Objetos
  FLista := TObjectList.Create;

  Self.PreencherLista(aCaminhoArquivo);
end;

destructor TConcreteAggregateCSV.Destroy;
begin
  FLista.Free;
  inherited;
end;

function TConcreteAggregateCSV.GetIterator: IIterator;
begin
  //Cria o iterator, informando o próprio Aggregate como parametro
  Result := TConcreteIterator.Create(Self);
end;

function TConcreteAggregateCSV.GetLista: TObjectList;
begin
  //Retorna uma referencia da lista
  Result := FLista;
end;

procedure TConcreteAggregateCSV.PreencherLista(const aCaminhoArquivo: String);
var
  xArquivoCSV: TextFile;
  xStringListValores: TStringList;
  xLinha: string;
  Cliente: TCliente;
begin
  // Carrega o arquivo CSV
  AssignFile(xArquivoCSV, aCaminhoArquivo);
  Reset(xArquivoCSV);

  xStringListValores := TStringList.Create;
  try
    // Percorre as linhas do arquivo
    while not Eof(xArquivoCSV) do
    begin
      // Faz a leitura da linha do arquivo
      ReadLn(xArquivoCSV, xLinha);

      // Atribui o conteúdo da linha na propriedade CommaText da StringList
      // para extrair cada valor em diferentes posições
      xStringListValores.StrictDelimiter := True;
      xStringListValores.CommaText := xLinha;

      // Cria e preenche o objeto com os dados da linha do arquivo
      Cliente          := TCliente.Create;
      Cliente.Codigo   := StrToIntDef(xStringListValores[0], 0);
      Cliente.Nome     := xStringListValores[1];
      Cliente.Endereco := xStringListValores[2];
      Cliente.Pais     := xStringListValores[3];
      Cliente.Email    := xStringListValores[4];

      // Adiciona o objeto na lista
      FLista.Add(Cliente);
    end;
  finally
    xStringListValores.Free;
    CloseFile(xArquivoCSV);
  end;
end;

end.
