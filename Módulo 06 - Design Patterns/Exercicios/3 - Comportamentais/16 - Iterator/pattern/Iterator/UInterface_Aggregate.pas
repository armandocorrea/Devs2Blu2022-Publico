unit UInterface_Aggregate;

interface

uses UInterface_Iterator, System.Contnrs;

type
  IAggregate = interface

    //Retorna uma referencia da lista de objetos
    function GetLista: TObjectList;

    //Retorna uma instancia do Iterator
    function GetIterator: IIterator;
  end;

implementation

end.
