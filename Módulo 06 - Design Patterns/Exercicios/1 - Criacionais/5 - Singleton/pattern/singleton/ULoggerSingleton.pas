unit ULoggerSingleton;

interface

type
  TLoggerSingleton = class
  private
    //Variável que aponta para o arquivo de log
    FArquivoLog: TextFile;

    //O construtor é declarado como privado
    //pois o método principal é "ObterInstancia"
    constructor Create;
  public
    //Método principal do Singleton
    class function ObterInstancia: TLoggerSingleton;

    //Método chamado pelo "Create" indiretamente
    class function NewInstance: TObject; override;

    //Método para registrar o texto do parâmetro no arquivo de log
    procedure RegistrarLog(const aTexto: string);
  end;

var
  Instancia: TLoggerSingleton;

implementation

uses
  System.SysUtils, Vcl.Forms;

{ TLoggerSingleton }

constructor TLoggerSingleton.Create;
var
  xDiretorioAplicacao: string;
begin
  //Associa o aquivo "Log.txt" que está na pasta do projeto
  xDiretorioAplicacao := ExtractFilePath(Application.ExeName);
  AssignFile(FArquivoLog, xDiretorioAplicacao + 'Log.txt');

  //Se o arquivo não existir, é criado
  if not FileExists(xDiretorioAplicacao + 'Log.txt') then
  begin
    Rewrite(FArquivoLog);
    CloseFile(FArquivoLog);
  end;
end;

class function TLoggerSingleton.NewInstance: TObject;
begin
  //Se já houver uma instância, ela é retornada
  //caso contrário, o objeto é instanciado antes de ser retornado

  if not Assigned(Instancia) then
  begin
    //Chama a função "NewInstance" da herança (TObject)
    Instancia := TLoggerSingleton(inherited NewInstance);
  end;

  Result := Instancia;
end;

class function TLoggerSingleton.ObterInstancia: TLoggerSingleton;
begin
  //Chama o método Create, que cria (uma única vez) e retorna a instância
  Result := TLoggerSingleton.Create;
end;

procedure TLoggerSingleton.RegistrarLog(const aTexto: string);
begin
  //Abre o arquivo de log para edição
  Append(FArquivoLog);

  //Escreve o texto no arquivo de log
  WriteLn(FArquivoLog, aTexto);

  //Fecha o arquivo
  CloseFile(FArquivoLog);
end;

initialization

finalization
  //Libera o Singleton da memória
  FreeAndNil(Instancia);

end.
