unit UInterface_Mediator;

interface

uses UInterface_Colleague;

type
  IMediator = interface
    function AdicionarMembro(aMembro: IColleague): String;
    function RemoverMembro(const aNome: String): String;
    function EnviarProposta(const aRemetente, aDestinatario, aProposta: String): String;
    function ObterMembro(const aNome: String): IColleague;
    procedure LiberarObjetos;
  end;

implementation

end.
