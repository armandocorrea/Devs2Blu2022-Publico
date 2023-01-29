unit UConcrete_Element_Funcionario;

interface

uses UInterface_Element;

type
  TFuncionario = class(TInterfacedObject, IElement)
  private
    FNome: String;
    FFuncao: String;
    FAdmissao: TDateTime;
    FSalario: Real;
    FSenioridade: String;
  public
    property Nome: String        read FNome        write FNome;
    property Funcao: String      read FFuncao      write FFuncao;
    property Admissao: TDateTime read FAdmissao    write FAdmissao;
    property Salario: Real       read FSalario     write FSalario;
    property Senioridade: String read FSenioridade write FSenioridade;

    // Método que será sobrescrito pelas subclasses (Concrete Elements)
    procedure Accept(aVisitor: IInterface); virtual;
  end;


implementation

{ TFuncionario }

procedure TFuncionario.Accept(aVisitor: IInterface);
begin
  Exit;
end;

end.
