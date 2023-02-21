unit UEntity.Users;

interface

uses
  System.JSON,
  GBSwagger.Model.Attributes;

type
  TUser = class
    private
      FId: Integer;
      FName: String;
      FStatus: Byte;
      FLogin: String;
      FPassword: String;
      FJSON: TJSONObject;

      function GetId: Integer;
      function GetLogin: String;
      function GetName: String;
      function GetPassword: String;
      function GetStatus: Byte;
      function GetJSON: TJSONObject;

      procedure SetId(const Value: Integer);
      procedure SetLogin(const Value: String);
      procedure SetName(const Value: String);
      procedure SetPassword(const Value: String);
      procedure SetStatus(const Value: Byte);
    public
      constructor Create; overload;
      constructor Create(const aId: Integer); overload;
      constructor Create(const aNome, aLogin, aPassword: String); overload;
      constructor Create(const aId: Integer; const aNome, aLogin, aPassword: String; const aStatus: Byte); overload;

      destructor  Destroy; override;

      [SwagProp('Usuário Id', True)]
      property Id: Integer read GetId write SetId;

      [SwagProp('Usuário Nome', True)]
      property Name: String read GetName write SetName;

      [SwagProp('Usuário Status', True)]
      property Status: Byte read GetStatus write SetStatus;

      [SwagProp('Usuário Login', True)]
      property Login: String read GetLogin write SetLogin;

      [SwagProp('Usuário Senha', True)]
      property Password: String read GetPassword write SetPassword;

      property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  SysUtils;

{ TUser }

constructor TUser.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TUser.Create(const aId: Integer);
begin
  FId := aId;

  Self.Create;
end;

constructor TUser.Create(const aNome, aLogin, aPassword: String);
begin
  FName     := aNome;
  FLogin    := aLogin;
  FPassword := aPassword;

  Self.Create;
end;

constructor TUser.Create(const aId: Integer; const aNome, aLogin,
  aPassword: String; const aStatus: Byte);
begin
  FId       := aId;
  FName     := aNome;
  FLogin    := aLogin;
  FPassword := aPassword;
  FStatus   := aStatus;

  Self.Create;
end;

destructor TUser.Destroy;
begin
  FreeAndNil(FJSON);

  inherited;
end;

function TUser.GetId: Integer;
begin
  Result := FId;
end;

function TUser.GetJSON: TJSONObject;
begin
  FJSON.AddPair('id',       FId.ToString);
  FJSON.AddPair('name',     FName);
  FJSON.AddPair('login',    FLogin);
  FJSON.AddPair('password', FPassword);

  Result := FJSON;
end;

function TUser.GetLogin: String;
begin
  Result := FLogin;
end;

function TUser.GetName: String;
begin
  Result := FName;
end;

function TUser.GetPassword: String;
begin
  Result := FPassword;
end;

function TUser.GetStatus: Byte;
begin
  Result := FStatus;
end;

procedure TUser.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TUser.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TUser.SetName(const Value: String);
begin
  FName := Value;
end;

procedure TUser.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TUser.SetStatus(const Value: Byte);
begin
  FStatus := Value;
end;

end.
