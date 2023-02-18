program RetornandoDados;

{$APPTYPE CONSOLE}

uses
  Horse,
  Horse.Jhonson,
  Horse.Query,
  FireDac.Comp.Client,
  FireDac.DApt,
  FireDAC.Stan.Def,
  FireDAC.Stan.Async,
  Data.DB,
  System.SysUtils,
  FireDAC.Phys.MySQL;

begin
  THorse.Use(Jhonson);
  THorse.Use(Query); //Middleware do Query deve vir sempre depois do Jhonson

  //Usando dados em memória
  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      xMemTable: TFDMemTable;
    begin
      xMemTable := TFDMemTable.Create(nil);
      xMemTable.FieldDefs.Add('Codigo', ftInteger, 0, False);
      xMemTable.FieldDefs.Add('Nome', ftString, 100, False);

      xMemTable.LogChanges    := False;
      xMemTable.CachedUpdates := True;

      xMemTable.Close;
      xMemTable.CreateDataSet;
      xMemTable.Open;

      xMemTable.AppendRecord([1, 'Ping']);
      xMemTable.AppendRecord([2, 'Pong']);
      xMemTable.ApplyUpdates;

      Res.Send<TFDMemTable>(xMemTable);
    end);

  //Lendo dados do banco Sakila (Actors)
  THorse.Get('/list',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      xConexao: TFDConnection;
      xDriver: TFDPhysMySQLDriverLink;
      xQuery: TFDQuery;
    begin
      xDriver  := TFDPhysMySQLDriverLink.Create(nil);
      xConexao := TFDConnection.Create(nil);
      xQuery   := TFDQuery.Create(nil);

      //Driver de Conexão do MySQL
      xDriver.VendorLib := ExtractFilePath(ParamStr(0)) + 'libmysql.dll';

      //Parâmetros de Configuração do banco
      xConexao.DriverName  := 'MySQL';
      xConexao.LoginPrompt := False;
      xConexao.Params.Add('Database=sakila');
      xConexao.Params.Add('User_Name=root');
      xConexao.Params.Add('Password=root');
      xConexao.Params.Add('Server=localhost');
      xConexao.Params.Add('DriverID=MySQL');
      xConexao.Open;

      //Query
      xQuery.Connection := xConexao;
      xQuery.Open('SELECT * FROM ACTOR');

      Res.Send<TFDQuery>(xQuery);
    end);

  THorse.Listen(9000,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + IntToStr(Horse.Port));
    end);
end.