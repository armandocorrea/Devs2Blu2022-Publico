unit UEntity.Logins;

interface

uses
  GBSwagger.Model.Attributes;

type
  TLogin = class
    private
      FLogin: String;
      FPassword: String;
      FToken: String;

      function GetLogin: String;
      function GetPassword: String;
      function GetToken: String;

      procedure SetLogin(const Value: String);
      procedure SetPassword(const Value: String);
      procedure SetToken(const Value: String);
    public
      constructor Create(const aLogin, aPassword: String);

      [SwagProp('Autenticação Login', True)]
      property Login: String read GetLogin write SetLogin;

      [SwagProp('Autenticação Password', True)]
      property Password: String read GetPassword write SetPassword;

      [SwagProp('Autenticação Token', True)]
      property Token: String read GetToken write SetToken;
  end;

implementation

{ TLogin }

constructor TLogin.Create(const aLogin, aPassword: String);
begin
  FLogin    := aLogin;
  FPassword := aPassword;
end;

function TLogin.GetLogin: String;
begin
  Result := FLogin;
end;

function TLogin.GetPassword: String;
begin
  Result := FPassword;
end;

function TLogin.GetToken: String;
begin
  Result := FToken;
end;

procedure TLogin.SetLogin(const Value: String);
begin
  FLogin := Value;
end;

procedure TLogin.SetPassword(const Value: String);
begin
  FPassword := Value;
end;

procedure TLogin.SetToken(const Value: String);
begin
  FToken := Value;
end;

end.
