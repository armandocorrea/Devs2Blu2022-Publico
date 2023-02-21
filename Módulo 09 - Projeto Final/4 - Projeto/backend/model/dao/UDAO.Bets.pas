unit UDAO.Bets;

interface

uses
  UDAO.Base, System.JSON;

type
  TDAOBets = class(TDAOBase)
    private
      function FindUser(const aId: Integer): TJSONObject;
      function FindMatch(const aId: Integer): TJSONObject;
    public
      Constructor Create;
      function ObterRegistros: TJSONArray; override;
      function ProcurarPorId(const aIdentificador: Integer): TJSONObject; override;
  end;

implementation

uses
  System.SysUtils, UDAO.Intf, UDAO.Users, UDAO.Matchs;

{ TDAOBets }

constructor TDAOBets.Create;
begin
  FTabela := 'bets';
end;

function TDAOBets.FindMatch(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOMatchs.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

function TDAOBets.FindUser(const aId: Integer): TJSONObject;
var
  xDAO: IDAO;
begin
  xDAO := TDAOUsers.Create;
  try
    Result := xDAO.ProcurarPorId(aId);
  finally
    xDAO := nil;
  end;
end;

function TDAOBets.ObterRegistros: TJSONArray;
var
  xJSONArray, xJSONArrayAux: TJSONArray;
  xJSONObject: TJSONObject;
  I: Integer;
  xIdUser: Integer;
  xIdMatch: Integer;
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

    xIdUser := StrToInt(xJSONObject.GetValue('idUser').Value);
    xJSONObject.AddPair('user', Self.FindUser(xIdUser));
    xJSONObject.RemovePair('idUser');

    xIdMatch := StrToInt(xJSONObject.GetValue('idMatch').Value);
    xJSONObject.AddPair('match', Self.FindMatch(xIdMatch));
    xJSONObject.RemovePair('idMatch');

    xJSONArrayAux.AddElement(xJSONObject);
  end;

  FreeAndNil(xJSONArray);
  Result := xJSONArrayAux;
end;

function TDAOBets.ProcurarPorId(const aIdentificador: Integer): TJSONObject;
var
  xJSONObject: TJSONObject;
  xIdUser: Integer;
  xIdMatch: Integer;
begin
  xJSONObject := inherited;

  if xJSONObject.Count = 0 then
    Exit(xJSONObject);

  xIdUser := StrToInt(xJSONObject.GetValue('idUser').Value);
  xJSONObject.AddPair('user', Self.FindUser(xIdUser));
  xJSONObject.RemovePair('idUser');

  xIdMatch := StrToInt(xJSONObject.GetValue('idMatch').Value);
  xJSONObject.AddPair('match', Self.FindMatch(xIdMatch));
  xJSONObject.RemovePair('idMatch');

  Result := xJSONObject;
end;

end.
