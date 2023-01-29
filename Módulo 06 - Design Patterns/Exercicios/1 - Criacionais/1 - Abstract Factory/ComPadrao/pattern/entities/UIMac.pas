unit UIMac;

interface

uses
  UInterfaces;

type
  TIMac = class(TInterfacedObject, IDesktop)
    function BuscarNomeProcessador: String;
    function BuscarTamanhoHD: String;
  end;

implementation

{ TIMac }

function TIMac.BuscarNomeProcessador: String;
begin
  Result := 'Intel Core i7';
end;

function TIMac.BuscarTamanhoHD: String;
begin
  Result := '500 GB';
end;

end.
