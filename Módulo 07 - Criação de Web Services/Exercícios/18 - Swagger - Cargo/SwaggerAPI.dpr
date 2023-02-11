program SwaggerAPI;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  Horse.CORS,
  Horse.GBSwagger,
  UPessoa in 'Model\entities\UPessoa.pas',
  UController.Pessoa in 'Model\controllers\UController.Pessoa.pas',
  UCargo in 'Model\entities\UCargo.pas',
  UController.Cargo in 'Model\controllers\UController.Cargo.pas';

procedure SwaggerConfig;
  begin
    Swagger
      .Register
        .SchemaOnError(TAPIError)
      .&End
      .Info
        .Title('Minha Primeira API Documentada')
        .Description('API Horse')
        .Contact
          .Name('Armando Neto')
          .Email('email@hotmail.com')
          .URL('http://www.mypage.com.br')
        .&End
      .&End
      .BasePath('v1');
  end;

  procedure Registry;
  begin
    THorse.Group.Prefix('v1')
      .Get('/pessoas', TPessoaController.GetPessoas)
      .Get('/pessoas/:id', TPessoaController.FindUser)
      .Post('/pessoas', TPessoaController.InsertUser)
      .Put('/pessoas/:id', TPessoaController.UpdateUser)
      .Delete('/pessoas/:id', TPessoaController.DeleteUser);

    THorse.Group.Prefix('v1')
      .Get('/cargos', TCargoController.GetOffices)
      .Get('/cargos/:id', TCargoController.FindOffice)
      .Post('/cargos', TCargoController.InsertOffice)
      .Put('/cargos/:id', TCargoController.UpdateOffice)
      .Delete('/cargos/:id', TCargoController.DeleteOffice);
  end;

begin
  THorse
    .Use(Cors);

  THorse
    .Use(HorseSwagger);

  //http://localhost:9000/swagger/doc/html
  SwaggerConfig;
  THorseGBSwaggerRegister.RegisterPath(TPessoaController);
  THorseGBSwaggerRegister.RegisterPath(TCargoController);

  Registry;

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + IntToStr(Horse.Port));
    end);
end.
