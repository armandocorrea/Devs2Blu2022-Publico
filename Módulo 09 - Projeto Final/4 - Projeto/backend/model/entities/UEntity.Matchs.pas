unit UEntity.Matchs;

interface

uses
  UEntity.Teams,
  GBSwagger.Model.Attributes;

type
  TMatch = class
    private
      FId: Integer;
      FDate: TDate;
      FHour: TTime;
      FTeamA: TTeam;
      FTeamB: TTeam;
      FResultTeamA: Byte;
      FResultTeamB: Byte;
      FStatus: Byte;

      function GetDate: TDate;
      function GetHour: TTime;
      function GetId: Integer;
      function GetResultTeamA: Byte;
      function GetResultTeamB: Byte;
      function GetStatus: Byte;
      function GetTeamA: TTeam;
      function GetTeamB: TTeam;

      procedure SetDate(const Value: TDate);
      procedure SetHour(const Value: TTime);
      procedure SetId(const Value: Integer);
      procedure SetResultTeamA(const Value: Byte);
      procedure SetResultTeamB(const Value: Byte);
      procedure SetStatus(const Value: Byte);
      procedure SetTeamA(const Value: TTeam);
      procedure SetTeamB(const Value: TTeam);
    public
      [SwagProp('Partida Id', True)]
      property Id: Integer read GetId write SetId;

      [SwagProp('Partida Data', True)]
      property Date: TDate read GetDate write SetDate;

      [SwagProp('Partida Hora', True)]
      property Hour: TTime read GetHour write SetHour;

      [SwagProp('Partida Time A', True)]
      property TeamA: TTeam read GetTeamA write SetTeamA;

      [SwagProp('Partida Time B', True)]
      property TeamB: TTeam read GetTeamB write SetTeamB;

      [SwagProp('Partida Resultado Time A', True)]
      property ResultTeamA: Byte read GetResultTeamA write SetResultTeamA;

      [SwagProp('Partida Resultado Time B', True)]
      property ResultTeamB: Byte read GetResultTeamB write SetResultTeamB;

      [SwagProp('Partida Status', True)]
      property Status: Byte read GetStatus write SetStatus;
  end;

implementation

{ TMatch }

function TMatch.GetDate: TDate;
begin
  Result := FDate;
end;

function TMatch.GetHour: TTime;
begin
  Result := FHour;
end;

function TMatch.GetId: Integer;
begin
  Result := FId;
end;

function TMatch.GetResultTeamA: Byte;
begin
  Result := FResultTeamA;
end;

function TMatch.GetResultTeamB: Byte;
begin
  Result := FResultTeamB;
end;

function TMatch.GetStatus: Byte;
begin
  Result := FStatus;
end;

function TMatch.GetTeamA: TTeam;
begin
  Result := FTeamA;
end;

function TMatch.GetTeamB: TTeam;
begin
  Result := FTeamB;
end;

procedure TMatch.SetDate(const Value: TDate);
begin
  FDate := Value;
end;

procedure TMatch.SetHour(const Value: TTime);
begin
  FHour := Value;
end;

procedure TMatch.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TMatch.SetResultTeamA(const Value: Byte);
begin
  FResultTeamA := Value;
end;

procedure TMatch.SetResultTeamB(const Value: Byte);
begin
  FResultTeamB := Value;
end;

procedure TMatch.SetStatus(const Value: Byte);
begin
  FStatus := Value;
end;

procedure TMatch.SetTeamA(const Value: TTeam);
begin
  FTeamA := Value;
end;

procedure TMatch.SetTeamB(const Value: TTeam);
begin
  FTeamB := Value;
end;

end.
