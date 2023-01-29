unit UConcreteImplementorHTML;

interface

uses
  UImplementor, System.Classes;

type
  TFormatoHTML = class(TInterfacedObject, IFormato)
  private
    FHTML: TStringList;

    procedure CriarCabecalhoHTML;
  public
    constructor Create;
    destructor Destroy; override;

    procedure PularLinha;
    procedure DesenharCabecalho(const aTitulo: string);
    procedure ExportarCampo(const aValor: string);
    procedure SalvarArquivo(const aNomeArquivo: string);
  end;

implementation

uses
  System.SysUtils, Vcl.Forms, ShellApi, Windows;

{ TFormatoHTML }

constructor TFormatoHTML.Create;
begin
  FHTML := TStringList.Create;
  Self.CriarCabecalhoHTML;
end;

procedure TFormatoHTML.CriarCabecalhoHTML;
begin
  FHTML.Add('<html>');
  FHTML.Add('<head>');
  FHTML.Add('<style>');
  FHTML.Add('body { font-family: Tahoma; }');
  FHTML.Add('table, td, th { border: 1px solid #ddd; text-align: left; }');
  FHTML.Add('table { border-collapse: collapse; width: 100%; }');
  FHTML.Add('</style>');
  FHTML.Add('<head>');
  FHTML.Add('</head>');
  FHTML.Add('<body>');
  FHTML.Add('<table>');
  FHTML.Add('<tr>');
end;

procedure TFormatoHTML.DesenharCabecalho(const aTitulo: string);
begin
  FHTML.Add(Format('<th>%s</th>', [aTitulo]));
end;

destructor TFormatoHTML.Destroy;
begin
  FreeAndNil(FHTML);
  inherited;
end;

procedure TFormatoHTML.ExportarCampo(const aValor: string);
begin
  FHTML.Add(Format('<td>%s</td>', [aValor]));
end;

procedure TFormatoHTML.PularLinha;
begin
  FHTML.Add('</tr><tr>');
end;

procedure TFormatoHTML.SalvarArquivo(const aNomeArquivo: string);
var
  xCaminhoAplicacao: string;
  xNomeCompleto: string;
begin
  FHTML.Add('</tr>');
  FHTML.Add('</table>');
  FHTML.Add('</body>');
  FHTML.Add('</html>');

  xCaminhoAplicacao := ExtractFilePath(Application.ExeName);
  xNomeCompleto := Format('%s%s.html', [xCaminhoAplicacao, aNomeArquivo]);
  DeleteFile(PWideChar(xNomeCompleto));
  FHTML.SaveToFile(xNomeCompleto);
  ShellExecute(0, nil, PChar(xNomeCompleto), nil, nil, SW_SHOWNORMAL);
end;

end.
