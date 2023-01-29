unit uInfoPC;

interface

uses
  Windows, SysUtils;

type

  TInfoPC = class
    public
      class function ComputerName: String;
      class function UserName: String;
      class function SystemDirectory: String;
      class function WindowsDirectory: String;
      class function TempPath: String;
      class function VersionEx: String;
  end;

implementation

{ TInfoPC }

class function TInfoPC.ComputerName: String;
var
  Buffer: Array[0..255] of Char;
  I: DWord;
begin
  I := SizeOf(Buffer);
  GetComputerName(Buffer, I);
  Result := StrPas(Buffer);
end;

class function TInfoPC.SystemDirectory: String;
var
  Buffer: Array[0..255] of Char;
begin
  GetSystemDirectory(Buffer, 255);
  Result := StrPas(Buffer);
end;

class function TInfoPC.TempPath: String;
var
  Buffer: Array[0..255] of Char;
begin
  GetTempPath(255, Buffer);
  Result := StrPas(Buffer);
end;

class function TInfoPC.UserName: String;
var
  Buffer: Array[0..255] of Char;
  I: DWord;
begin
  I := SizeOf(Buffer);
  GetUserName(Buffer, I);
  Result := StrPas(Buffer);
end;

class function TInfoPC.VersionEx: String;
var
  VersionInfo: TOSVersionInfo;
begin
  VersionInfo.dwOSVersionInfoSize := SizeOf(VersionInfo);

  GetVersionEx(VersionInfo);

  case VersionInfo.dwPlatformId of
    0:
      Result := 'Windows 3.11';
    1:
    begin
      case VersionInfo.dwMinorVersion of
        0:
          Result := 'Windows 95';
        10:
        begin
          if (VersionInfo.szCSDVersion[1] = 'A' ) then
            Result :='Windows 98 SE'
          else
            Result := 'Windows 98';
        end;
        90:
          Result := 'Windows Millenium';
      else
        Result := 'Não achei a Versão';
      end;
    end;
    2:
    begin
      case VersionInfo.dwMajorVersion of
        3:
          Result := 'Windows NT ' + IntToStr(VersionInfo.dwMajorVersion) + '.' +
                       IntToStr(VersionInfo.dwMinorVersion);
        4:
          Result := 'Windows NT ' + IntToStr(VersionInfo.dwMajorVersion) + '.' +
                       IntToStr(VersionInfo.dwMinorVersion);
        5:
        begin
          case VersionInfo.dwMinorVersion of
            0: Result := 'Windows 2000';
            1: Result := 'Windows XP';
          end;
        end;
        6:
          Result := 'Windows 7 ' + IntToStr(VersionInfo.dwMajorVersion) + '.' +
                       IntToStr(VersionInfo.dwMinorVersion);
        7:
          Result := 'Windows 8 ' + IntToStr(VersionInfo.dwMajorVersion) + '.' +
                       IntToStr(VersionInfo.dwMinorVersion);
        8:
          Result := 'Windows Vista ' + IntToStr(VersionInfo.dwMajorVersion) + '.' +
                       IntToStr(VersionInfo.dwMinorVersion);
        10:
          Result := 'Windows 10 ' + IntToStr(VersionInfo.dwMajorVersion) + '.' +
                       IntToStr(VersionInfo.dwMinorVersion);
        else
          Result := 'Não achei a Versão';
      end;

      if VersionInfo.szCSDVersion <> '' then
        Result := Result + ' ' + VersionInfo.szCSDVersion;
    end;
    else
      Result := 'Não achei a Platforma';
  end;

  Result := Result + ', Build: ' + IntToStr(LoWord(VersionInfo.dwBuildNumber));
end;

class function TInfoPC.WindowsDirectory: String;
var
  Buffer: Array[0..255] of Char;
begin
  GetWindowsDirectory(Buffer, 255);
  Result := StrPas(Buffer);
end;

end.
