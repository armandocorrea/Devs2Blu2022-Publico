unit UUtils.Functions;

interface

type
  TUtilsFunctions = class
    public
      class function IIF<T>(const aConditional: Boolean; const aValueTrue,aValueFalse: T): T;
  end;

implementation

{ TUtilsFunctions }

class function TUtilsFunctions.IIF<T>(const aConditional: Boolean; const aValueTrue,
  aValueFalse: T): T;
begin
  if aConditional then
    Result := aValueTrue
  else
    Result := aValueFalse;
end;

end.
