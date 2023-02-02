unit UObserver;

interface

uses
  UNotificacao;

type
  IObserver = interface
    ['{8F23CE89-0C31-4695-98FB-D2B009495552}']
    procedure Atualizar(aNotificacao: TNotificacao);
  end;

implementation

end.
