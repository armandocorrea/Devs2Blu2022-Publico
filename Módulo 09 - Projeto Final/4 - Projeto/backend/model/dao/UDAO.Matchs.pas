unit UDAO.Matchs;

interface

uses
  UDAO.Base, System.JSON;

type
  TDAOMatchs = class(TDAOBase)
    private
      function FindTeam(const aId: Integer): TJSONObject;
    public
      Constructor Create;
      function ObterRegistros: TJSONArray; override;
      function ProcurarPorId(const aIdentificador: Integer): TJSONObject; override;
  end;

implementation

uses
  System.SysUtils, UDAO.Intf, UDAO.Teams;

{ TDAOMatchs }

function TDAOMatchs.FindTeam(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOTeams.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

constructor TDAOMatchs.Create;
begin
  FTabela := 'matchs';
end;

function TDAOMatchs.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdTeam: Integer;
begin
  xJSONArray := inherited;

  if xJSONArray.Count = 0 then
    Exit(xJSONArray);

  xJSONArrayAux := TJSONArray.Create;

  for I := 0 to Pred(xJSONArray.Count) do
  begin
    xJSONObject := TJSONObject.ParseJSONValue(
      TEncoding.ASCII.GetBytes(
        xJSONArray[I].ToJSON), 0) as TJSONObject;

    xIdTeam := StrToInt(xJSONObject.GetValue('idTeamA').Value);
    xJSONObject.AddPair('teamA', Self.FindTeam(xIdTeam));
    xJSONObject.RemovePair('idTeamA');

    xIdTeam := StrToInt(xJSONObject.GetValue('idTeamB').Value);
    xJSONObject.AddPair('teamB', Self.FindTeam(xIdTeam));
    xJSONObject.RemovePair('idTeamB');

    xJSONArrayAux.AddElement(xJSONObject);
  end;

  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;
end;

function TDAOMatchs.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdTeam: Integer;
begin
  xJSONObject := inherited;

  if xJSONObject.Count = 0 then
    Exit(xJSONObject);

  xIdTeam := StrToInt(xJSONObject.GetValue('idTeamA').Value);
  xJSONObject.AddPair('teamA', Self.FindTeam(xIdTeam));
  xJSONObject.RemovePair('idTeamA');

  xIdTeam := StrToInt(xJSONObject.GetValue('idTeamB').Value);
  xJSONObject.AddPair('teamB', Self.FindTeam(xIdTeam));
  xJSONObject.RemovePair('idTeamB');

  Result := xJSONObject;
end;

end.
