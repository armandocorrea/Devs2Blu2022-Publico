unit UInterface_Visitor;

interface

uses UConcrete_Element_Gerente, UConcrete_Element_Programador;

type
  IVisitor = interface
    ['{DA5C2120-C5B1-4B34-9D1C-3B5DF94117A4}']
    //O Visitor possui um método sobrecarregado para cada Concrete Element existente
    procedure Visit(aProgramador: TProgramador); Overload;
    procedure Visit(aGerente: TGerente); Overload;
  end;

implementation

end.
