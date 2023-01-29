unit UInterface_Element;

interface

type
  IElement = interface
    //Método que chamará o Visitor para executar a operação
    procedure Accept(aVisitor: IInterface);
  end;

implementation

end.
