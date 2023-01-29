unit USecoes;

interface

uses //Uses para a seção interface
  UAnimal;

type //Tipos definidos na unit
  TRegistro = record
    Id: Integer;
    Data: TDate;
    Hora: TTime;
    Obse: String;
  end;

  TCachorro = class (TAnimal)
    procedure MeuSomEh; override;
  end;

var //Declaração de variaveis globais - Sempre escapar
  vGlobal1: Integer;

implementation

uses //Uses para a seção implementation
  Vcl.Dialogs;

{ TCachorro }

procedure TCachorro.MeuSomEh;
begin
  ShowMessage('Au Au!');
end;

end.
