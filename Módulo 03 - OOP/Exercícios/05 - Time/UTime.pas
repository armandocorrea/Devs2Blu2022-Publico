unit UTime;

interface

uses
  UJogador, System.Generics.Collections;

type
  TTime = class //TObject
    private
      FId: Integer;
      FNomeTime: String;
      FTecnico: String;
      FAnoFundacao: TDate;
      FJogadores: TList<TJogador>;

      function GetAnoFundacao: TDate;
      function GetId: Integer;
      function GetJogadores: TList<TJogador>;
      function GetNomeTime: String;
      function GetTecnico: String;

      procedure SetAnoFundacao(const Value: TDate);
      procedure SetId(const Value: Integer);
      procedure SetJogadores(const Value: TList<TJogador>);
      procedure SetNomeTime(const Value: String);
      procedure SetTecnico(const Value: String);
    public
      constructor Create(aJogadores: TList<TJogador>);

      property Id: Integer                read GetId          write SetId;
      property NomeTime: String           read GetNomeTime    write SetNomeTime;
      property Tecnico: String            read GetTecnico     write SetTecnico;
      property AnoFundacao: TDate         read GetAnoFundacao write SetAnoFundacao;
      property Jogadores: TList<TJogador> read GetJogadores;
  end;

implementation

{ TTime }

constructor TTime.Create(aJogadores: TList<TJogador>);
begin
  Inherited create;

  FJogadores := aJogadores;
end;

function TTime.GetAnoFundacao: TDate;
begin
  Result := FAnoFundacao;
end;

function TTime.GetId: Integer;
begin
  Result := FId;
end;

function TTime.GetJogadores: TList<TJogador>;
begin
  Result := FJogadores;
end;

function TTime.GetNomeTime: String;
begin
  Result := FNomeTime;
end;

function TTime.GetTecnico: String;
begin
  Result := FTecnico;
end;

procedure TTime.SetAnoFundacao(const Value: TDate);
begin
  FAnoFundacao := Value;
end;

procedure TTime.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTime.SetJogadores(const Value: TList<TJogador>);
begin
  FJogadores := Value;
end;

procedure TTime.SetNomeTime(const Value: String);
begin
  FNomeTime := Value;
end;

procedure TTime.SetTecnico(const Value: String);
begin
  FTecnico := Value;
end;

end.
