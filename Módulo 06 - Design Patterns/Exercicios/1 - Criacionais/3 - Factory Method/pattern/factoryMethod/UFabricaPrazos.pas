unit UFabricaPrazos;

interface

uses
  UTipoPrazo;

type
  TFabricaPrazos = class(TInterfacedObject, IFactoryMethod)
    function ConsultarPrazo(const aPrazo: String): ITipoPrazo;
  end;

implementation

{ TFabricaPrazos }

uses UPrazoAnual, UPrazoMensal;

function TFabricaPrazos.ConsultarPrazo(const aPrazo: String): ITipoPrazo;
begin
  if aPrazo = 'Mensal' then
    Result := TPrazoMensal.Create
  else if aPrazo = 'Anual' then
    Result := TPrazoAnual.Create;
end;

end.
