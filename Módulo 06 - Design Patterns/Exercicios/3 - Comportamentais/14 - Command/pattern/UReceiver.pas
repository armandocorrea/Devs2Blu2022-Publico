unit UReceiver;

interface

type
  TReceiver = class
  public
    procedure ExtrairProcessos;
    procedure ExtrairProgramas;
    procedure ExtrairVariaveisAmbiente;
  end;

implementation

uses
  Dialogs, Messages, Windows, TlHelp32, psAPI, SysUtils, Registry, Classes;

{ TReceiver }

procedure TReceiver.ExtrairProcessos;
var
  xHandle: THandle;
  xProcessEntry: TProcessEntry32;
  xListaProcessos: TStringList;
begin
  // Método responsável por extrair a lista de processos em execução

  xHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  xListaProcessos := TStringList.Create;
  try
    xProcessEntry.dwSize := SizeOf(TProcessEntry32);
    Process32Next(xHandle, xProcessEntry);

    // Percorre os processos que estão em execução,
    // adicionando-os na variável ListaProcessos
    repeat
      xListaProcessos.Add(xProcessEntry.szExeFile)
    until not Process32Next(xHandle, xProcessEntry);

    // Grava a lista de processos no arquivo "Processos.txt"
    xListaProcessos.SaveToFile(GetCurrentDir + '\Processos.txt');
  finally
    CloseHandle(xHandle);
    FreeAndNil(xListaProcessos);
  end;
end;

procedure TReceiver.ExtrairProgramas;
const
  CHAVE_REGISTRO = 'Software\Microsoft\Windows\CurrentVersion\Uninstall\ ';
var
  xRegistro: TRegistry;
  xContador: Integer;
  xListaChaves: TStringList;
  xListaProgramas: TStringList;
begin
  // Método responsável por extrair a lista de programas instalados
  // Obs: a aplicação deve ser executada como Administrador

  xRegistro := TRegistry.Create;
  xListaChaves := TStringList.Create;
  xListaProgramas := TStringList.Create;
  try
    // Obtém a lista de chaves existentes no caminho do registro
    // que armazena as informações de programas instalados
    xRegistro.RootKey := HKEY_LOCAL_MACHINE;
    xRegistro.OpenKey(CHAVE_REGISTRO, False);
    xRegistro.GetKeyNames(xListaChaves);
    xRegistro.CloseKey;

    // Percorre a lista de chaves para acessar o valor do atributo "DisplayName"
    for xContador := 0 to Pred(xListaChaves.Count) do
    begin
      xRegistro.RootKey := HKEY_LOCAL_MACHINE;
      xRegistro.OpenKey(CHAVE_REGISTRO + xListaChaves[xContador], False);

      if xRegistro.ReadString('DisplayName') <> EmptyStr then
        // Adiciona o nome do programa na variável ListaProgramas
        xListaProgramas.Add(xRegistro.ReadString('DisplayName'));

      xRegistro.CloseKey;
    end;

    // Grava a lista de processos no arquivo "Programas.txt"
    xListaProgramas.SaveToFile(GetCurrentDir + '\Programas.txt');
  finally
    // Libera os objetos da memória
    FreeAndNil(xListaProgramas);
    FreeAndNil(xListaChaves);
    FreeAndNil(xRegistro);
  end;
end;

procedure TReceiver.ExtrairVariaveisAmbiente;
var
  xVariavel: PChar;
  xListaVariaveis: TStringList;
begin
  // Método responsável por extrair a lista das variáveis de ambiente

  xListaVariaveis := TStringList.Create;
  try
    // Obtém a lista das variáveis de ambiente
    xVariavel := GetEnvironmentStrings;
    while xVariavel^ <> #0 do
    begin
      xListaVariaveis.Add(StrPas(xVariavel));
      xListaVariaveis.Add(EmptyStr);
      Inc(xVariavel, lStrLen(xVariavel) + 1);
    end;
    FreeEnvironmentStrings(xVariavel);

    // Grava a lista de variáveis no arquivo "Variaveis.txt"
    xListaVariaveis.SaveToFile(GetCurrentDir + '\Variaveis.txt');
  finally
    // Libera o objeto da memória
    FreeAndNil(xListaVariaveis);
  end;
end;

end.
