unit UVostro;

interface

uses
  UInterfaces;

type
  TVostro = class(TInterfacedObject, INotebook)
    function BuscarTamanhoTela: String;
    function BuscarMemoriaRAM: String;
  end;

implementation

{ TVostro }

function TVostro.BuscarMemoriaRAM: String;
begin
  Result := '3GB DDR3';
end;

function TVostro.BuscarTamanhoTela: String;
begin
  Result := '15 Polegadas';
end;

end.
