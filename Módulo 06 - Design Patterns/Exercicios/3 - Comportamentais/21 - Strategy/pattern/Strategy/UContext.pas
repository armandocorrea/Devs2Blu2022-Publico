unit UContext;

interface

uses UInterface_Strategy;

type
  TTipoValidacao = (avDLL, avRegExLib, avMailBoxLayer);

  TContext = class
  private
    // Variável para manter uma referência ao Concrete Strategy selecionado
    FStrategy: IStrategy;
  public
    // Método responsável por encaminhar a validação do e-mail ao Concrete Strategy
    function ValidarEmail(const aTipoValidacao: TTipoValidacao; const aEmail: String): Boolean;
  end;

implementation

{ TContext }

uses UConcrete_StrategyDLL, UConcrete_StrategyMailBoxLayer,
  UConcrete_StrategyRegExLib;

function TContext.ValidarEmail(const aTipoValidacao: TTipoValidacao;
  const aEmail: String): Boolean;
begin
  // Cria a instância de um Concrete Strategy conforme o tipo de validação selecionado
  case aTipoValidacao of
    avDLL:
      FStrategy := TConcreteStrategyDLL.Create;
    avRegExLib:
      FStrategy := TConcreteStrategyRegExLib.Create;
    avMailBoxLayer:
      FStrategy := TConcreteStrategyMailBoxLayer.Create;
  end;

  // Chama a função "ValidarEmail" do Concrete Strategy
  Result := FStrategy.ValidarEmail(aEmail);
end;

end.
