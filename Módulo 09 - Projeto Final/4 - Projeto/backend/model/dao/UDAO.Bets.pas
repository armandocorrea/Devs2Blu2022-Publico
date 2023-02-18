unit UDAO.Bets;

interface

uses
  UDAO.Base;

type
  TDAOBets = class(TDAOBase)
  private
    public
      Constructor Create;
  end;

implementation

{ TDAOBets }

constructor TDAOBets.Create;
begin
  FTabela := 'bets';
end;



end.
