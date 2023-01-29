unit UAluno;

interface

uses
  UDisciplina;

type
  TProvas = array[1..2] of Double;

  TAluno = class
    private
      FMatricula: Integer;
      FNome: String;
      FNotas: TProvas;
      FTrabalho: Double;
      FDisciplina: TDisciplina;

      FMedia: Double;

      procedure SetDisciplina(const Value: TDisciplina);
      procedure SetMatricula(const Value: Integer);
      procedure SetNome(const Value: String);
      procedure SetNotas(const Value: TProvas);
      procedure SetTrabalho(const Value: Double);

      function GetDisciplina: TDisciplina;
      function GetMatricula: Integer;
      function GetNome: String;
      function GetNotas: TProvas;
      function GetTrabalho: Double;
      function GetMedia: Double;
    public
      constructor Create(aDisciplina: TDisciplina);
      destructor destroy; override;

      procedure CalcularMedia;
      function NotaFinal: Double;

      property Matricula: Integer      read GetMatricula  write SetMatricula;
      property Nome: String            read GetNome       write SetNome;
      property Notas: TProvas          read GetNotas      write SetNotas;
      property Trabalho: Double        read GetTrabalho   write SetTrabalho;
      property Disciplina: TDisciplina read GetDisciplina write SetDisciplina;
      property Media: Double           read GetMedia;
  end;

implementation

uses
  System.SysUtils;

{ TAluno }

procedure TAluno.CalcularMedia;
var
  xMedia: Double;
begin
  if FNotas[1] = -1 then
    raise Exception.Create('Não foi lançado a nota da Prova 1');

  if FNotas[2] = -1 then
    raise Exception.Create('Não foi lançado a nota da Prova 2');

  if FTrabalho = -1 then
    raise Exception.Create('Não foi lançado a nota do Trabalho');

  xMedia := (FNotas[1] + FNotas[2] + FTrabalho) / 3;

  FMedia := xMedia;
end;

constructor TAluno.Create(aDisciplina: TDisciplina);
begin
  FDisciplina := aDisciplina;
  FNotas[1]   := -1;
  FNotas[2]   := -1;
  FTrabalho   := -1;
  FMedia      := -1
end;

destructor TAluno.destroy;
begin
  FreeAndNil(FDisciplina);

  inherited;
end;

function TAluno.GetDisciplina: TDisciplina;
begin
  Result := FDisciplina;
end;

function TAluno.GetMatricula: Integer;
begin
  Result := FMatricula;
end;

function TAluno.GetMedia: Double;
begin
  Result := FMedia;
end;

function TAluno.GetNome: String;
begin
  Result := FNome;
end;

function TAluno.GetNotas: TProvas;
begin
  Result := FNotas;
end;

function TAluno.GetTrabalho: Double;
begin
  Result := FTrabalho;
end;

function TAluno.NotaFinal: Double;
const
  C_NOTA_CORTE = 7;
begin
  if FMedia = -1 then
    raise Exception.Create('Não foi calculado a média do aluno');

  if FMedia >= C_NOTA_CORTE then
    Result := 0
  else
    Result := C_NOTA_CORTE - FMedia;
end;

procedure TAluno.SetDisciplina(const Value: TDisciplina);
begin
  FDisciplina := Value;
end;

procedure TAluno.SetMatricula(const Value: Integer);
begin
  FMatricula := Value;
end;

procedure TAluno.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TAluno.SetNotas(const Value: TProvas);
begin
  FNotas := Value;
end;

procedure TAluno.SetTrabalho(const Value: Double);
begin
  FTrabalho := Value;
end;

end.
