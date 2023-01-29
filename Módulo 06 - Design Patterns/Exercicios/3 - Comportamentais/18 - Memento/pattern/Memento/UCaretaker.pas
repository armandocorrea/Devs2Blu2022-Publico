unit UCaretaker;

interface

uses
  Generics.Collections, UMemento;

type
  TCaretaker = class
    private
      FHistoricoAlteracoes: TObjectDictionary<String, TMemento>;
    public
      constructor Create;
      destructor Destroy; override;

      //Método para adicionar um novo Memento na lista
      procedure Adicionar(const aDataHora: String; aMemento: TMemento);

      //Função para retornar um Memento conforme a data e hora
      function Obter(const aDataHora: String): TMemento;
  end;

implementation

{ TCaretaker }

procedure TCaretaker.Adicionar(const aDataHora: String; aMemento: TMemento);
begin
  //Adiciona o Memento no dicionario de objetos
  FHistoricoAlteracoes.Add(aDataHora, aMemento);
end;

constructor TCaretaker.Create;
begin
  //Cria o dicionario de objetos
  // "doOwnsValues" significa que o próprio dicionario irá liberar os objetos internos
  FHistoricoAlteracoes := TObjectDictionary<String, TMemento>.Create([doOwnsValues]);
end;

destructor TCaretaker.Destroy;
begin
  FHistoricoAlteracoes.Free;
  inherited;
end;

function TCaretaker.Obter(const aDataHora: String): TMemento;
begin
  //Obtém o memento conforme a chave, que é uma combinação da data e hora
  Result := FHistoricoAlteracoes.Items[aDataHora];
end;

end.
