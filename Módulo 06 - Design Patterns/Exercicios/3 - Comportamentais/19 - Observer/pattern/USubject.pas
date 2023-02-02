unit USubject;

interface

uses
  UObserver;

type
  ISubject = interface
    ['{90CC11CE-6A1A-4B6D-A4EA-CA7153C800CC}']
    // Método para adicionar Observers à lista
    procedure AdicionarObserver(aObserver: IObserver);

    // Métodos para remover Observers da lista
    procedure RemoverObserver(aObserver: IObserver);

    // Método responsável por notificar os Observers registrados
    procedure Notificar;
  end;

implementation

end.
