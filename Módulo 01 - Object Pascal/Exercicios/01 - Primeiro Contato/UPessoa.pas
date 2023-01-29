unit UPessoa;

interface

type

  TPessoa = class
    private
      FCodigo: Integer;
      FNome: String;
      FSalario: Currency;

      function GetCodigo: Integer;
      function GetNome: String;
      function GetSalario: Currency;

      procedure SetCodigo(const aValue: Integer);
      procedure SetNome(const aValue: String);
      procedure SetSalario(const aValue: Currency);
    published
      property Codigo: Integer   read GetCodigo  write SetCodigo;
      property Nome: String      read GetNome    write SetNome;
      property Salario: Currency read GetSalario write SetSalario;
  end;

implementation

{ TPessoa }

function TPessoa.GetCodigo: Integer;
begin
  Result := FCodigo;
end;

function TPessoa.GetNome: String;
begin
  Result := FNome;
end;

function TPessoa.GetSalario: Currency;
begin
  Result := FSalario;
end;

procedure TPessoa.SetCodigo(const aValue: Integer);
begin
  FCodigo := aValue;
end;

procedure TPessoa.SetNome(const aValue: String);
begin
  FNome := aValue;
end;

procedure TPessoa.SetSalario(const aValue: Currency);
begin
  FSalario := aValue;
end;

end.
