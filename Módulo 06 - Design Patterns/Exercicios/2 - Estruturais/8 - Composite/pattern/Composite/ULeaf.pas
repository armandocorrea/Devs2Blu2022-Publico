unit ULeaf;

interface

uses
  UComponent_Operation;

type
  TViagem = class(TInterfacedObject, IViagem)
    private
      FOrigem: String;
      FDestino: String;
      FData: TDateTime;
    public
      procedure DefinirOrigem(const aCidade: String);
      procedure DefinirDestino(const aCidade: String);
      procedure DefinirData(const aData: TDateTime);

      //Operation
      function CalcularValor: Double;
  end;


implementation

{ TViagem }

function TViagem.CalcularValor: Double;
begin
  //Result := ConsultarValorViagem(FOrigem, FDestino, FData);
  Result := 10;
end;

procedure TViagem.DefinirData(const aData: TDateTime);
begin
  FData := aData;
end;

procedure TViagem.DefinirDestino(const aCidade: String);
begin
  FDestino := aCidade;
end;

procedure TViagem.DefinirOrigem(const aCidade: String);
begin
  FOrigem := aCidade;
end;

end.
