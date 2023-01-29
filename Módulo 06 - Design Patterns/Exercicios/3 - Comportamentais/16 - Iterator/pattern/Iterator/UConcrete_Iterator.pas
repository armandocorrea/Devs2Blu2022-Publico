unit UConcrete_Iterator;

interface

uses UInterface_Iterator, UInterface_Aggregate;

type
  TConcreteIterator = class(TInterfacedObject, IIterator)
    private
      FAggregate: IAggregate;
      FIndice: Integer;
    public
      constructor Create(aAggregate: IAggregate);

      procedure PrimeiroObjeto;
      procedure ProximoObjeto;
      function ObjetoAtual: TObject;
      function FimLista: Boolean;
  end;

implementation

{ TConcreteIterator }

constructor TConcreteIterator.Create(aAggregate: IAggregate);
begin
  FAggregate := aAggregate;
end;

function TConcreteIterator.FimLista: Boolean;
begin
  //Verifica se está no fim da lista
  //ao comparar o índice atual com a quantidade de objetos existentes
  Result := FIndice = Pred(FAggregate.GetLista.Count);
end;

function TConcreteIterator.ObjetoAtual: TObject;
begin
  //Retorna o objeto que está no indice atual
  Result := FAggregate.GetLista.Items[FIndice];
end;

procedure TConcreteIterator.PrimeiroObjeto;
begin
  //"Reseta" o índice, atribuindo o valor zero
  FIndice := 0;
end;

procedure TConcreteIterator.ProximoObjeto;
begin
  //Incrementa o indice para avançar uma posição na lista
  Inc(FIndice);
end;

end.
