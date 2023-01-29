unit UInterface_Strategy;

interface

type
  IStrategy = interface
    function ValidarEmail(const aEmail: String): Boolean;
  end;

implementation

end.
