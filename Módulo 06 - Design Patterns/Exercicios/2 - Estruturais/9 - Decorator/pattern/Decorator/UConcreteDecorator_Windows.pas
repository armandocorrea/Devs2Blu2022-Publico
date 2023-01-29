unit UConcreteDecorator_Windows;

interface

uses
  UDecorator;

type
  TWindowsDecorator = class(TDecorator)
    private
      function ObterVersaoWindows: String;
    protected
      function ObterDadosExcecao: String; Override;
  end;

implementation

uses
  System.SysUtils, Windows, Registry;

{ TWindowsDecorator }

function TWindowsDecorator.ObterDadosExcecao: String;
begin
  Result := Inherited ObterDadosExcecao;
  Result := Result + 'Versão do Sistema Operacional: ' + Self.ObterVersaoWindows;
end;

function TWindowsDecorator.ObterVersaoWindows: String;
var
  xRegistro: TRegistry;
  xMajorVersion: byte;
  xMinorVersion: byte;
begin
  // No Windows 10, a aplicação deve ser executada como Administrador
  xRegistro := TRegistry.Create;
  try
    xRegistro.RootKey := HKEY_LOCAL_MACHINE;
    xRegistro.OpenKey('Software\Microsoft\Windows NT\CurrentVersion', False);
    xMajorVersion := xRegistro.ReadInteger('CurrentMajorVersionNumber');
    xMinorVersion := xRegistro.ReadInteger('CurrentMinorVersionNumber');

    case xMajorVersion of
      5: case xMinorVersion of
          1: Result := 'Windows XP';
        end;
      6: case xMinorVersion of
          0: Result := 'Windows Vista';
          1: Result := 'Windows 7';
          2: Result := 'Windows 8';
          3: Result := 'Windows 8.1';
        end;
      10: case xMinorVersion of
          0: Result := 'Windows 10';
        end;
    end;
  finally
    FreeAndNil(xRegistro);
  end;
end;

end.
