unit uPaciente;

interface

uses
  Generics.Collections;

type
  TPaciente = class
  private
    FCPF: String;
    FNome: String;
    FEspecialidade: String;

    procedure SetCPF(const Value: String);
    procedure SetEspecialidade(const Value: String);
    procedure SetNome(const Value: String);

    function GetCPF: String;
    function GetEspecialidade: String;
    function GetNome: String;
  public
    constructor Create(const aCpf, aNome, aEspecialidade: String);
    destructor Destroy; override;

    property CPF: String           read GetCPF           write SetCPF;
    property Nome: String          read GetNome          write SetNome;
    property Especialidade: String read GetEspecialidade write SetEspecialidade;
  end;

  TFilaPaciente = class
    private
      FChamadaIniciada: Boolean;
      FFila: TQueue<TPaciente>;
      FPacienteAnterior: TPaciente;

      function GetPacienteAnterior: TPaciente;

      procedure Notify(Sender: TObject; const aItem: TPaciente; aAction: TCollectionNotification);
    public
      constructor Create;
      destructor Destroy; override;

      function Adicionar(aPaciente: TPaciente): Boolean;
      function Proximo: TPaciente;

      property PacienteAnterior: TPaciente read GetPacienteAnterior;
  end;

implementation

uses
  System.SysUtils;

{ TPaciente }

constructor TPaciente.Create(const aCpf, aNome, aEspecialidade: String);
begin
  FCPF           := aCpf;
  FNome          := aNome;
  FEspecialidade := aEspecialidade;
end;

destructor TPaciente.Destroy;
begin
  inherited;
end;

function TPaciente.GetCPF: String;
begin
  Result := FCPF;
end;

function TPaciente.GetEspecialidade: String;
begin
  Result := FEspecialidade
end;

function TPaciente.GetNome: String;
begin
  Result := FNome;
end;

procedure TPaciente.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

procedure TPaciente.SetEspecialidade(const Value: String);
begin
  FEspecialidade := Value;
end;

procedure TPaciente.SetNome(const Value: String);
begin
  FNome := Value;
end;

{ TListaPaciente }

function TFilaPaciente.Adicionar(aPaciente: TPaciente): Boolean;
begin
  FFila.Enqueue(aPaciente);
  Result := True;
end;

constructor TFilaPaciente.Create;
begin
  FFila := TQueue<TPaciente>.Create;
  FFila.OnNotify := Self.Notify;
end;

destructor TFilaPaciente.Destroy;
begin
  FFila.Clear;
  FreeAndNil(FFila);

  inherited;
end;

function TFilaPaciente.GetPacienteAnterior: TPaciente;
begin
  Result := FPacienteAnterior;
end;

procedure TFilaPaciente.Notify(Sender: TObject; const aItem: TPaciente; aAction: TCollectionNotification);
begin
  case aAction of
    cnRemoved:
      FPacienteAnterior := aItem;
  end;
end;

function TFilaPaciente.Proximo: TPaciente;
begin
  Result := nil;

  if FFila.Count = 0 then
    raise Exception.Create('Nenhum paciente para chamar.')
  else if (FFila.Count = 1) and Assigned(FPacienteAnterior) then
  begin
    FFila.Dequeue;
    raise Exception.Create('Nenhum paciente para chamar.')
  end
  else if FChamadaIniciada then
  begin
    FFila.Dequeue;
    Result := FFila.Peek;
  end
  else
  begin
    Result            := FFila.Peek;
    FPacienteAnterior := Result;
    FChamadaIniciada  := True;
  end;
end;

end.
