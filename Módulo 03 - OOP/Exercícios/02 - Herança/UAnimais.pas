unit UAnimais;

interface

type
  TEnumAnimal = (stCachorro, stGato, stPassaro);

  TAnimal = class
    private
      FPatas: Byte;

      function GetPatas: Byte;
      procedure SetPatas(const aValue: Byte);
    public
      function RetornarSom: String; virtual; abstract;
      property Patas: Byte read GetPatas write SetPatas;
  end;

  TCachorro = class(TAnimal)
    private
    public
      constructor Create;
      function RetornarSom: String; override;
  end;

  TGato = class(TAnimal)
    private
    public
      constructor Create;
      function RetornarSom: String; override;
  end;

  TPassaro = class(TAnimal)
    private
    public
      constructor Create;
      function RetornarSom: String; override;
  end;

implementation

{TAnimal}

procedure TAnimal.SetPatas(const aValue: Byte);
begin
  FPatas := aValue;
end;

function TAnimal.GetPatas: Byte;
begin
  Result := FPatas;
end;

{TCachorro}

function TCachorro.RetornarSom: string;
begin
  Result := 'Au au';
end;

constructor TCachorro.Create;
begin
  FPatas := 4;
end;

{TGato}

function TGato.RetornarSom: string;
begin
  Result := 'Miau miau';
end;

constructor TGato.Create;
begin
  FPatas := 4;
end;

{TPassaro}

function TPassaro.RetornarSom: string;
begin
  Result := 'Piu piu';
end;

constructor TPassaro.Create;
begin
  FPatas := 2;
end;

end.
