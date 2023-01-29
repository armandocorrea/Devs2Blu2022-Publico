unit uFilaComHeranca;

interface

uses
  uPaciente, Generics.Collections;

type

  TFilaComHeranca = class(TQueue<TPaciente>)
    private
      FChamadaIniciada: Boolean;
      FPacienteAnterior: TPaciente;

      function GetPacienteAnterior: TPaciente;
      procedure Notify(Sender: TObject; const aItem: TPaciente; aAction: TCollectionNotification);
    public
      constructor Create;
      function Adicionar(aPaciente: TPaciente): Boolean;
      function Proximo: TPaciente;

      property PacienteAnterior: TPaciente read GetPacienteAnterior;
  end;

implementation

uses
  System.SysUtils;

{ TFilaComHeranca }

function TFilaComHeranca.Adicionar(aPaciente: TPaciente): Boolean;
begin
  Self.Adicionar(aPaciente);
end;

constructor TFilaComHeranca.Create;
begin
  Self.OnNotify := Notify;
end;

function TFilaComHeranca.GetPacienteAnterior: TPaciente;
begin
  Result := FPacienteAnterior;
end;

procedure TFilaComHeranca.Notify(Sender: TObject; const aItem: TPaciente;
  aAction: TCollectionNotification);
begin
  case aAction of
    cnRemoved:
      FPacienteAnterior := aItem;
  end;
end;

function TFilaComHeranca.Proximo: TPaciente;
begin
  Result := nil;

  if Self.Count = 0 then
    raise Exception.Create('Nenhum paciente para chamar.')
  else if (Self.Count = 1) and Assigned(FPacienteAnterior) then
  begin
    Self.Dequeue;
    raise Exception.Create('Nenhum paciente para chamar.')
  end
  else if FChamadaIniciada then
  begin
    Self.Dequeue;
    Result := Self.Peek;
  end
  else
  begin
    Result            := Self.Peek;
    FPacienteAnterior := Result;
    FChamadaIniciada  := True;
  end;
end;

end.
