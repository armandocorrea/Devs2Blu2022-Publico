unit UConcrete_Element_Programador;

interface

uses UConcrete_Element_Funcionario;

type
  TProgramador = class(TFuncionario)
    public
      procedure Accept(aVisitor: IInterface); override;
  end;

implementation

{ TProgramador }

uses UInterface_Visitor;

procedure TProgramador.Accept(aVisitor: IInterface);
var
  xConcreteVisitor: IVisitor;
begin
  //Aplica um typecast do parametro para o tipo IVisitor
  xConcreteVisitor := aVisitor as IVisitor;

  //Chama o método "Visit" do Concrete Visitor, enviando a própria instancia como parametro
  //Essa instancia é o que indicará qual sobrecarga do método "Visit" será chamado
  xConcreteVisitor.Visit(Self);
end;

end.
