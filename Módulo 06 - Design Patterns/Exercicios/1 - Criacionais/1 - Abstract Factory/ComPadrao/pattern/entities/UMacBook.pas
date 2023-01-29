unit UMacBook;

interface

uses
  UInterfaces;

type
  TMacBook = class(TInterfacedObject, INotebook)
    function BuscarTamanhoTela: String;
    function BuscarMemoriaRAM: String;
  end;

implementation

{ TMacBook }

function TMacBook.BuscarMemoriaRAM: String;
begin
  Result := '4GB DDR3';
end;

function TMacBook.BuscarTamanhoTela: String;
begin
  Result := '11.6 Polegadas'
end;

end.
