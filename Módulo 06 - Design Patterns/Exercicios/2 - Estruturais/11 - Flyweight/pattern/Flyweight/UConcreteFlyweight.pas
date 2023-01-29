unit UConcreteFlyweight;

interface

uses
  UInterface, System.Classes, PNGImage;

type
  { Concrete Flyweight - classe base }
  TCartao = class(TInterfacedObject, ICartao)
  protected
    FPNGArquivo: TPNGImage;
    FMensagem: TStringList;
    FNomeLeitor: String;

    procedure SetNomeLeitor(const aNomeLeitor: string);
  public
    constructor Create;
    destructor Destroy; override;

    procedure Exportar;

    // propriedade extrínseca
    property NomeLeitor: string write SetNomeLeitor;
  end;

  { Concrete Flyweight - classe herdada }
  TCartaoBrasil = class(TCartao)
    constructor Create;
  end;

  { Concrete Flyweight - classe herdada }
  TCartaoEspanha = class(TCartao)
  public
    constructor Create;
  end;

  { Concrete Flyweight - classe herdada }
  TCartaoEUA = class(TCartao)
  public
    constructor Create;
  end;

implementation

uses
  System.SysUtils;

{ TCartao }

constructor TCartao.Create;
begin
  // cria o objeto da classe TStringList para armazenar a mensagem do cartão
  FMensagem := TStringList.Create;

  // cria o objeto da classe TPNGImage para trabalhar com PNG
  FPNGArquivo := TPNGImage.Create;
end;

destructor TCartao.Destroy;
begin
  FreeAndNil(FMensagem);
  FreeAndNil(FPNGArquivo);
  inherited;
end;

procedure TCartao.Exportar;
begin
  // escreve o texto por cima da imagem
  FPNGArquivo.Canvas.TextOut(5, 10, StringReplace(FMensagem[0], '%nome%', FNomeLeitor, []));
  FPNGArquivo.Canvas.TextOut(5, 70, FMensagem[1]);
  FPNGArquivo.Canvas.TextOut(5, 95, FMensagem[2]);
  FPNGArquivo.Canvas.TextOut(5, 120, FMensagem[3]);

  // salva o arquivo
  FPNGArquivo.SaveToFile(Format('C:\Cartoes\Cartao - %s.png', [FNomeLeitor]));
end;

procedure TCartao.SetNomeLeitor(const aNomeLeitor: string);
begin
  FNomeLeitor := aNomeLeitor;
end;

{ TCartaoEUA }

constructor TCartaoEUA.Create;
begin
  inherited;

  // carrega a imagem da bandeira dos EUA
  FPNGArquivo.LoadFromFile('C:\Imagens\EUA.png');

  // preenche a mensagem em inglês
  FMensagem.Add('Hello, %nome%!');
  FMensagem.Add('Happy New Year!');
  FMensagem.Add('Remember to always visit the blog');
  FMensagem.Add('to check out the newest posts! :)');
end;

{ TCartaoEspanha }

constructor TCartaoEspanha.Create;
begin
  inherited;

  // carrega a imagem da bandeira da Espanha
  FPNGArquivo.LoadFromFile('C:\Imagens\Espanha.png');

  // preenche a mensagem em espanhol
  FMensagem.Add('Hola, %nome%!');
  FMensagem.Add('Feliz Año Nuevo!');
  FMensagem.Add('Siempre visite el blog');
  FMensagem.Add('para leer los nuevos artículos! :)');
end;

{ TCartaoBrasil }

constructor TCartaoBrasil.Create;
begin
  inherited;

  // carrega a imagem da bandeira do Brasil
  FPNGArquivo.LoadFromFile('C:\Imagens\Brasil.png');

  // preenche a mensagem em português
  FMensagem.Add('Olá, %nome%!');
  FMensagem.Add('Feliz Ano Novo!');
  FMensagem.Add('Sempre visite o blog');
  FMensagem.Add('para ler os novos artigos! :)');
end;

end.
