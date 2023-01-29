unit UJogador;

interface

type
  TJogador = class
    private
      FId: Integer;
      FNome: String;
      FIdade: Integer;
      FPosicao: String;

      function GetId: Integer;
      function GetIdade: Integer;
      function GetNome: String;
      function GetPosicao: String;

      procedure SetId(const Value: Integer);
      procedure SetIdade(const Value: Integer);
      procedure SetNome(const Value: String);
      procedure SetPosicao(const Value: String);
    public
      property Id: Integer     read GetId      write SetId;
      property Nome: String    read GetNome    write SetNome;
      property Idade: Integer  read GetIdade   write SetIdade;
      property Posicao: String read GetPosicao write SetPosicao;
  end;

implementation

{ TJogador }

function TJogador.GetId: Integer;
begin
  Result := FId;
end;

function TJogador.GetIdade: Integer;
begin
  Result := FIdade;
end;

function TJogador.GetNome: String;
begin
  Result := FNome;
end;

function TJogador.GetPosicao: String;
begin
  Result := FPosicao;
end;

procedure TJogador.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TJogador.SetIdade(const Value: Integer);
begin
  FIdade := Value;
end;

procedure TJogador.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TJogador.SetPosicao(const Value: String);
begin
  FPosicao := Value;
end;

end.
