unit UInterface_Colleague;

interface

type
  IColleague = interface
    function EnviarProposta(const aDestinatario, aProposta: String): String;
    function ReceberProposta(const aRemetente, aProposta: String): String;

    function ObterNome: String;
    function Entrar: String;
    function Sair: String;
  end;

implementation

end.
