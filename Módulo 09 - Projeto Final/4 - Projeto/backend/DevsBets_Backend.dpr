program DevsBets_Backend;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.Jhonson,
  Horse.CORS,
  Horse.JWT,
  Horse.BasicAuthentication,
  Horse.GBSwagger,
  System.SysUtils,
  UController.Team in 'model\controllers\UController.Team.pas',
  UDAO.Intf in 'model\dao\UDAO.Intf.pas',
  UDAO.Teams in 'model\dao\UDAO.Teams.pas',
  UUtil.Banco in 'model\utils\UUtil.Banco.pas',
  UDAO.Matchs in 'model\dao\UDAO.Matchs.pas',
  UController.Match in 'model\controllers\UController.Match.pas',
  UDAO.Bets in 'model\dao\UDAO.Bets.pas',
  UController.Bet in 'model\controllers\UController.Bet.pas',
  UDAO.Base in 'model\dao\UDAO.Base.pas',
  UController.User in 'model\controllers\UController.User.pas',
  UController.Login in 'model\controllers\UController.Login.pas',
  UEntity.Users in 'model\entities\UEntity.Users.pas',
  UEntity.Teams in 'model\entities\UEntity.Teams.pas',
  UEntity.Matchs in 'model\entities\UEntity.Matchs.pas',
  UEntity.Bets in 'model\entities\UEntity.Bets.pas',
  UEntity.Logins in 'model\entities\UEntity.Logins.pas',
  UDAO.Users in 'model\dao\UDAO.Users.pas',
  UController.Base in 'model\controllers\UController.Base.pas';

procedure Registry;
begin
  //Login
  THorse.Group.Prefix('v1')
    .Post('/login', TControllerLogin.PostLogin);

  //Users
  THorse.Group.Prefix('v1')
    .Get('/users', TControllerUser.Gets)
    .Get('/users/:id', TControllerUser.Get)
    .Post('/users', TControllerUser.Post)
    .Delete('/users/:id', TControllerUser.Delete);

  //Teams
  THorse.Group.Prefix('v1')
    .Get('/teams', TControllerTeam.Gets)
    .Get('/teams/:id', TControllerTeam.Get)
    .Post('/teams', TControllerTeam.Post)
    .Delete('/teams/:id', TControllerTeam.Delete);

  //Match
  THorse.Group.Prefix('v1')
    .Get('/matchs', TControllerMatch.Gets)
    .Get('/matchs/:id', TControllerMatch.Get)
    .Post('/matchs', TControllerMatch.Post)
    .Delete('/matchs/:id', TControllerMatch.Delete);

  //Bet
  THorse.Group.Prefix('v1')
    .Get('/bets', TControllerBet.Gets)
    .Get('/bets/:id', TControllerBet.Get)
    .Post('/bets', TControllerBet.Post)
    .Delete('/bets/:id', TControllerBet.Delete);
end;

procedure SwaggerConfig;
begin
  THorseGBSwaggerRegister.RegisterPath(TControllerUser);
  THorseGBSwaggerRegister.RegisterPath(TControllerTeam);
  THorseGBSwaggerRegister.RegisterPath(TControllerMatch);
  THorseGBSwaggerRegister.RegisterPath(TControllerBet);
  THorseGBSwaggerRegister.RegisterPath(TControllerLogin);

  //http://localhost:9000/swagger/doc/html
  Swagger
    .Info
      .Title('Documentação API DevsBets')
      .Description('DevsBets - Lance seu Palpite')
      .Contact
        .Name('Armando Neto')
        .Email('email@hotmail.com')
        .URL('http://www.mypage.com.br')
      .&End
    .&End
    .BasePath('v1');
end;

procedure ConfigMiddleware;
begin
  THorse
    .Use(Cors)
    .Use(HorseSwagger)
    .Use(Jhonson());

  //Basic Authentication usado para o Login
  THorse
    .Use(HorseBasicAuthentication(
      TControllerUser.ValidateUser,
      THorseBasicAuthenticationConfig
        .New
          .SkipRoutes(['/v1/users',
                       '/v1/users/:id',
                       '/v1/teams',
                       '/v1/teams/:id',
                       '/v1/matchs',
                       '/v1/matchs/:id',
                       '/v1/bets',
                       '/v1/bets/:id',
                       '/swagger/doc/html',
                       '/swagger/doc/json'])));

  //JWT usado para as demais rotas
  THorse
    .Use(HorseJWT('KeyDevsBets',
      THorseJWTConfig
        .New
          .SkipRoutes(['/v1/login',
                       '/v1/users',
                       '/v1/users/:id',
                       '/swagger/doc/html',
                       '/swagger/doc/json'])));
end;

begin
  ConfigMiddleware;
  SwaggerConfig;
  Registry;

  THorse.Listen(9000);
end.