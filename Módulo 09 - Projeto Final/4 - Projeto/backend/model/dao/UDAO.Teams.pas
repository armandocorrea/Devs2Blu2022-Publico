unit UDAO.Teams;

interface

uses
  UDAO.Base;

type
  TDAOTeams = class(TDAOBase)
    public
      constructor Create;
  end;

implementation

{ TDAOTeams }

constructor TDAOTeams.Create;
begin
  FTabela := 'teams';
end;

end.
