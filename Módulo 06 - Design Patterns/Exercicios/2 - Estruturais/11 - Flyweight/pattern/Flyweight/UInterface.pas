unit UInterface;

interface

type
  ICartao = interface
    ['{9CDD1E8D-1850-4923-9ABC-4F764D67AA05}']
    procedure SetNomeLeitor(const aNome: String);
    procedure Exportar;
    property NomeLeitor: String write SetNomeLeitor;
  end;

implementation

end.
