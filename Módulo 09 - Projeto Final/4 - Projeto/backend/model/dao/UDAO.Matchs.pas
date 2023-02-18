unit UDAO.Matchs;

interface

uses
  UDAO.Base;

type
  TDAOMatchs = class(TDAOBase)
  private
    public
      Constructor Create;
  end;

implementation

{ TDAOMatchs }

constructor TDAOMatchs.Create;
begin
  FTabela := 'matchs';
end;

end.
