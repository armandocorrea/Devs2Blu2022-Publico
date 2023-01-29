unit UConcreteDecorator_Usuario;

interface

uses
  UDecorator;

type
  TUsuarioDecorator = class(TDecorator)
    private
      function ObterNomeUsuario: String;
    protected
      function ObterDadosExcecao: String; Override;
  end;

implementation

uses
  Winapi.Windows;

{ TUsuarioDecorator }

function TUsuarioDecorator.ObterDadosExcecao: String;
begin
  Result := Inherited ObterDadosExcecao;
  Result := Result + 'Usuário: ' + Self.ObterNomeUsuario;
end;

function TUsuarioDecorator.ObterNomeUsuario: String;
var
  xSize: DWord;
begin
  // retorna o login do usuário do sistema operacional
  xSize := 1024;
  SetLength(result, xSize);
  GetUserName(PChar(Result), xSize);
  SetLength(Result, xSize - 1);
end;

end.
