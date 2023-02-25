unit UService.User.Authenticated;

interface

uses
  UEntity.Users;

type
  //Classe utilizando o Padrão Singleton
  //Para armazenar o usuário logado
  TUserAuthenticated = class
    private
      FUser: TUser;

      function GetUser: TUser;
      procedure SetUser(const Value: TUser);
    public
      constructor Create;
      destructor  Destroy; override;

      class function GetInstance: TUserAuthenticated;
      class function NewInstance: TObject; override;

      property User: TUser read GetUser write SetUser;
  end;

var
  GbInstance: TUserAuthenticated;

implementation

uses
  System.SysUtils;

{ TLoginAutenticado }

constructor TUserAuthenticated.Create;
begin
  //Aqui não precisamos criar o FUser
  //Quem passará o mesmo criado será a tela de Login
end;

function TUserAuthenticated.GetUser: TUser;
begin
  Result := FUser;
end;

class function TUserAuthenticated.NewInstance: TObject;
begin
  if not Assigned(GbInstance) then
    GbInstance := TUserAuthenticated(Inherited NewInstance);

  Result := GbInstance;
end;

procedure TUserAuthenticated.SetUser(const Value: TUser);
begin
  FUser := Value;
end;

destructor TUserAuthenticated.Destroy;
begin
  FreeAndNil(FUser);
  inherited;
end;

class function TUserAuthenticated.GetInstance: TUserAuthenticated;
begin
  Result := TUserAuthenticated.Create;
end;

initialization

finalization
  FreeAndNil(GbInstance);

end.
