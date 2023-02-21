unit UEntity.Bets;

interface

uses
  UEntity.Users,
  UEntity.Matchs,
  GBSwagger.Model.Attributes,
  System.JSON;

type
  TBet = class
    private
      FId: Integer;
      FUser: TUser;
      FMatch: TMatch;
      FResultTeamA: Byte;
      FResultTeamB: Byte;
      FStatus: Byte;
      FJSON: TJSONObject;

      function GetId: Integer;
      function GetMatch: TMatch;
      function GetResultTeamA: Byte;
      function GetResultTeamB: Byte;
      function GetStatus: Byte;
      function GetUser: TUser;
      function GetJSON: TJSONObject;

      procedure SetId(const Value: Integer);
      procedure SetMatch(const Value: TMatch);
      procedure SetResultTeamA(const Value: Byte);
      procedure SetResultTeamB(const Value: Byte);
      procedure SetStatus(const Value: Byte);
      procedure SetUser(const Value: TUser);
    public
      constructor Create; overload;
      constructor Create(const aId: Integer); overload;
      constructor Create(const aMatch: TMatch; const aResultTeamA, aResultTeamB: Byte; const aUser: TUser); overload;
      constructor Create(const aId: Integer; const aMatch: TMatch; const aResultTeamA, aResultTeamB, aStatus: Byte; const aUser: TUser); overload;

      destructor Destroy; override;

      [SwagProp('Palpite Id', True)]
      property Id: Integer read GetId write SetId;

      [SwagProp('Palpite Usuário', True)]
      property User: TUser read GetUser write SetUser;

      [SwagProp('Palpite Partida', True)]
      property Match: TMatch read GetMatch write SetMatch;

      [SwagProp('Palpite Resultado Time A', True)]
      property ResultTeamA: Byte read GetResultTeamA write SetResultTeamA;

      [SwagProp('Palpite Resultado Time B', True)]
      property ResultTeamB: Byte read GetResultTeamB write SetResultTeamB;

      [SwagProp('Palpite Status', True)]
      property Status: Byte read GetStatus write SetStatus;

      property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{ TBet }

constructor TBet.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TBet.Create(const aId: Integer);
begin
  FId := aId;

  Self.Create;
end;

constructor TBet.Create(const aMatch: TMatch; const aResultTeamA, aResultTeamB: Byte; const aUser: TUser);
begin
  FMatch       := aMatch;
  FResultTeamA := aResultTeamA;
  FResultTeamB := aResultTeamB;
  //Aqui vamos criar um novo objeto para não liberarmos
  //Objeto do Singleton
  FUser := TUser.Create(aUser.Id);

  Self.Create;
end;

constructor TBet.Create(const aId: Integer; const aMatch: TMatch;
  const aResultTeamA, aResultTeamB, aStatus: Byte; const aUser: TUser);
begin
  FId          := aId;
  FMatch       := aMatch;
  FResultTeamA := aResultTeamA;
  FResultTeamB := aResultTeamB;
  FStatus      := aStatus;
  FUser        := aUser;

  Self.Create;
end;

destructor TBet.Destroy;
begin
  FreeAndNil(FUser);
  FreeAndNil(FMatch);
  FreeAndNil(FJSON);
  inherited;
end;

function TBet.GetId: Integer;
begin
  Result := FId;
end;

function TBet.GetJSON: TJSONObject;
begin
  FJSON.AddPair('resultTeamA', FResultTeamA.ToString);
  FJSON.AddPair('resultTeamB', FResultTeamB.ToString);
  FJSON.AddPair('idUser', FUser.Id.ToString);
  FJSON.AddPair('idMatch', FMatch.Id.ToString);

  Result := FJSON;
end;

function TBet.GetMatch: TMatch;
begin
  Result := FMatch;
end;

function TBet.GetResultTeamA: Byte;
begin
  Result := FResultTeamA;
end;

function TBet.GetResultTeamB: Byte;
begin
  Result := FResultTeamB;
end;

function TBet.GetStatus: Byte;
begin
  Result := FStatus;
end;

function TBet.GetUser: TUser;
begin
  Result := FUser;
end;

procedure TBet.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TBet.SetMatch(const Value: TMatch);
begin
  FMatch := Value;
end;

procedure TBet.SetResultTeamA(const Value: Byte);
begin
  FResultTeamA := Value;
end;

procedure TBet.SetResultTeamB(const Value: Byte);
begin
  FResultTeamB := Value;
end;

procedure TBet.SetStatus(const Value: Byte);
begin
  FStatus := Value;
end;

procedure TBet.SetUser(const Value: TUser);
begin
  FUser := Value;
end;

end.
