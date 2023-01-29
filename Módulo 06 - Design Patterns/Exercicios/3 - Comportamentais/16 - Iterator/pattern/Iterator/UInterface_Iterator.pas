unit UInterface_Iterator;

interface

type
  IIterator = interface
    //Move para o primeiro objeto da lista
    procedure PrimeiroObjeto;

    //Move para o próximo objeto da lista
    procedure ProximoObjeto;

    //Retorna o objeto atual da lista
    function ObjetoAtual: TObject;

    //Verifica se está no fim da lista
    function FimLista: Boolean;
  end;

implementation

end.
