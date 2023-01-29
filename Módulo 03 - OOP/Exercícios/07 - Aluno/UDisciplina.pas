unit UDisciplina;

interface

type
  TDisciplina = class
    private
      FId: Integer;
      FDescricao: String;

      function GetDescricao: String;
      function GetId: Integer;

      procedure SetDescricao(const Value: String);
      procedure SetId(const Value: Integer);
    public
      property Id: Integer       read GetId        write SetId;
      property Descricao: String read GetDescricao write SetDescricao;
  end;

implementation

{ TDisciplina }

function TDisciplina.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TDisciplina.GetId: Integer;
begin
  Result := FId;
end;

procedure TDisciplina.SetDescricao(const Value: String);
begin
  FDescricao := Value;
end;

procedure TDisciplina.SetId(const Value: Integer);
begin
  FId := Value;
end;

end.
