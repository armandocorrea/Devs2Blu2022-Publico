unit UService.Bet;

interface

uses UService.Base, UEntity.Bets, UEntity.Matchs, UEntity.Users,
     Generics.Collections;

type
  TServiceBet = class(TServiceBase)
    private
      FBet: TBet;
      FBets: TObjectList<TBet>;

      function GetBets: TObjectList<TBet>;

      procedure PreencherBets(const aJsonBets: String);
      procedure CarregarMatch(const aJsonMatch: String; var aMatch: TMatch);
      procedure CarregarUser(const aJsonUser: String; var aUser: TUser);
    public
      constructor Create; overload;
      constructor Create(aBet: TBet); overload;
      destructor  Destroy; override;

      procedure Registrar; override;
      procedure Listar; override;
      procedure Excluir; override;

      function ObterRegistro(const aId: Integer): TObject; override;

      property Bets: TObjectList<TBet> read GetBets;
  end;

implementation

uses
  System.SysUtils, REST.Types, UUtils.Constants,
  FireDAC.comp.Client, Dataset.Serialize, UService.Intf, UService.Match,
  UEntity.Teams, UUtils.Functions;

{ TServiceBet }

constructor TServiceBet.Create;
begin
  Inherited Create;

  FBets := TObjectList<TBet>.Create;
end;

constructor TServiceBet.Create(aBet: TBet);
begin
  FBet := aBet;

  Self.Create;
end;

destructor TServiceBet.Destroy;
begin
  FreeAndNil(FBet);
  FreeAndNil(FBets);
  inherited;
end;

procedure TServiceBet.Excluir;
begin
  if (not Assigned(FBet)) or (FBet.Id = 0) then
    raise Exception.Create('Nenhum Palpite foi escolhido para exclusão.');

  try
    FRESTClient.BaseURL := Format(URL_BASE_BET + '/%d', [FBet.Id]);
    FRESTRequest.Method := rmDelete;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO_SEM_RETORNO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

function TServiceBet.GetBets: TObjectList<TBet>;
begin
  Result := FBets;
end;

procedure TServiceBet.Listar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_BET;
    FRESTRequest.Method := rmGet;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_SUCESSO:
        Self.PreencherBets(FRESTResponse.Content);
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro ao carregar a lista de Times. Código do Erro: ' + FRESTResponse.StatusCode.ToString);
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

function TServiceBet.ObterRegistro(const aId: Integer): TObject;
begin
  Result := nil;
  //Método sem implementação no momento
end;

procedure TServiceBet.PreencherBets(const aJsonBets: String);
var
  xMemTable: TFDMemTable;
  xMatch: TMatch;
  xUser: TUser;
  xStatus: Byte;
begin
  FBets.Clear;

  xMemTable := TFDMemTable.Create(nil);

  try
    xMemTable.LoadFromJSON(FRESTResponse.Content);

    while not xMemTable.Eof do
    begin
      Self.CarregarMatch(xMemTable.FieldByName('match').AsString,
                         xMatch);

      Self.CarregarUser(xMemTable.FieldByName('user').AsString,
                        xUser);

      xStatus := 0;
      if xMemTable.FieldByName('status').AsString = 'true' then
        xStatus := 1;

      FBets.Add(TBet.Create(
        xMemTable.FieldByName('id').AsInteger,
        xMatch,
        xMemTable.FieldByName('result_Team_A').AsInteger,
        xMemTable.FieldByName('result_Team_B').AsInteger,
        xStatus,
        xUser));

      xMemTable.Next;
    end;
  finally
    FreeAndNil(xMemTable);
  end;
end;

procedure TServiceBet.CarregarMatch(const aJsonMatch: String; var aMatch: TMatch);
var
  xMemTable: TFDMemTable;
  xMemTableTeam: TFDMemTable;
  xTeamA, xTeamB: TTeam;
  xStatus: Byte;
begin
  aMatch        := nil;
  xMemTable     := TFDMemTable.Create(nil);
  xMemTableTeam := TFDMemTable.Create(nil);

  try
    xMemTable.LoadFromJSON(aJsonMatch);

    if xMemTable.RecordCount > 0 then
    begin
      xMemTableTeam.LoadFromJSON(xMemTable.FieldByName('team_A').AsString);
      xTeamA := TTeam.Create(xMemTableTeam.FieldByName('name').AsString);

      xMemTableTeam.LoadFromJSON(xMemTable.FieldByName('team_B').AsString);
      xTeamB := TTeam.Create(xMemTableTeam.FieldByName('name').AsString);

      xStatus := TUtilsFunctions.IIF<Byte>(
        xMemTable.FieldByName('status').AsString = 'true',
        1, 0);

      aMatch := TMatch.Create(
        xMemTable.FieldByName('id').AsInteger,
        xMemTable.FieldByName('date').AsDateTime,
        xMemTable.FieldByName('hour').AsDateTime,
        xTeamA,
        xTeamB,
        xMemTable.FieldByName('result_Team_A').AsInteger,
        xMemTable.FieldByName('result_Team_B').AsInteger,
        xStatus);
    end;
  finally
    FreeAndNil(xMemTable);
    FreeAndNil(xMemTableTeam);
  end;
end;

procedure TServiceBet.CarregarUser(const aJsonUser: String; var aUser: TUser);
var
  xMemTable: TFDMemTable;
  xStatus: Byte;
begin
  aUser     := nil;
  xMemTable := TFDMemTable.Create(nil);

  try
    xMemTable.LoadFromJSON(aJsonUser);

    if xMemTable.RecordCount > 0 then
    begin
      xStatus := TUtilsFunctions.IIF<Byte>(
        xMemTable.FieldByName('status').AsString = 'true',
        1, 0);

      aUser := TUser.Create(
        xMemTable.FieldByName('id').AsInteger,
        xMemTable.FieldByName('name').AsString,
        xMemTable.FieldByName('login').AsString,
        xMemTable.FieldByName('password').AsString,
        xStatus);
    end;
  finally
    FreeAndNil(xMemTable);
  end;
end;

procedure TServiceBet.Registrar;
begin
  try
    FRESTClient.BaseURL := URL_BASE_BET;
    FRESTRequest.Params.AddBody(FBet.JSON);
    FRESTRequest.Method := rmPost;
    FRESTRequest.Execute;

    case FRESTResponse.StatusCode of
      API_CRIADO:
        Exit;
      API_NAO_AUTORIZADO:
        raise Exception.Create('Usuário não autorizado.');
      else
        raise Exception.Create('Erro não catalogado.');
    end;
  except
    on e: exception do
      raise Exception.Create(e.Message);
  end;
end;

end.
