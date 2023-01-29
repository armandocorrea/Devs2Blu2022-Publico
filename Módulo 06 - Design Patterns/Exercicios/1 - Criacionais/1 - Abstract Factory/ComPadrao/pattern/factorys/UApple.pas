unit UApple;

interface

uses
  UInterfaces;

type
  TApple = class(TInterfacedObject, IFactoryMarca)
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

uses
  UMacBook, UIMac;

{ TApple }

function TApple.ConsultarDesktop: IDesktop;
begin
  Result := TIMac.Create;
end;

function TApple.ConsultarNotebook: INotebook;
begin
  Result := TMacBook.Create;
end;

end.
