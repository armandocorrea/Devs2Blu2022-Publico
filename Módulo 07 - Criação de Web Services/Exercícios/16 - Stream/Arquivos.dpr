program Arquivos;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Horse,
  Horse.OctetStream, // It's necessary to use the unit
  System.Classes,
  System.SysUtils;

begin
  // It's necessary to add the middleware in the Horse:
  THorse.Use(OctetStream);

  THorse.Get('/arquivos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TFileStream;
    begin
      // Now you can send your stream:
      LStream := TFileStream.Create(ExtractFilePath(ParamStr(0)) + 'Instalando o Horse e Wizard.pdf', fmOpenRead);
      Res.Send<TStream>(LStream);
    end);

  THorse.Post('/arquivos',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LStream: TMemoryStream;
    begin
      LStream := Req.Body<TMemoryStream>;
      LStream.SaveToFile(ExtractFilePath(ParamStr(0)) + 'Cópia.pdf');
      Res.Send('Arquivo enviado com sucesso...').Status(201);
    end);

  THorse.Listen(9000);
end.
