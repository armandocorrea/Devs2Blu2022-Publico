unit UReuniao;

interface

uses
  System.UITypes;

type
  TReuniao = class
    private
      FNome: String;
      FData: TDate;
      FHora: TTime;
      FCategoria: TColor;
      FParticipantes: String;

      function GetCategoria: TColor;
      function GetData: TDate;
      function GetHora: TTime;
      function GetNome: String;
      function GetParticipantes: String;

      procedure SetCategoria(const Value: TColor);
      procedure SetData(const Value: TDate);
      procedure SetHora(const Value: TTime);
      procedure SetNome(const Value: String);
      procedure SetParticipantes(const Value: String);
    public
      constructor Create;

      //Método principal do Prototype
      function Clonar: TReuniao;

      property Nome: String read GetNome write SetNome;
      property Data: TDate  read GetData write SetData;
      property Hora: TTime  read GetHora write SetHora;
      property Categoria: TColor read GetCategoria write SetCategoria;
      property Participantes: String read GetParticipantes write SetParticipantes;
  end;

implementation

{ TReuniao }

function TReuniao.Clonar: TReuniao;
var
  xNovaReuniao: TReuniao;
begin
  //Cria um novo objeto
  xNovaReuniao := TReuniao.Create;

  //Copia as propriedades do objeto atual
  //atribuindo-as ao novo objeto criado
  xNovaReuniao.Nome := Self.Nome;
  xNovaReuniao.Data := Self.Data;
  xNovaReuniao.Hora := Self.Hora;
  xNovaReuniao.Categoria := Self.Categoria;
  xNovaReuniao.Participantes := Self.Participantes;

  Result := xNovaReuniao;
end;

constructor TReuniao.Create;
begin

end;

function TReuniao.GetCategoria: TColor;
begin
  Result := FCategoria;
end;

function TReuniao.GetData: TDate;
begin
  Result := FData;
end;

function TReuniao.GetHora: TTime;
begin
  Result := FHora;
end;

function TReuniao.GetNome: String;
begin
  Result := FNome;
end;

function TReuniao.GetParticipantes: String;
begin
  Result := FParticipantes;
end;

procedure TReuniao.SetCategoria(const Value: TColor);
begin
  FCategoria := Value;
end;

procedure TReuniao.SetData(const Value: TDate);
begin
  FData := Value;
end;

procedure TReuniao.SetHora(const Value: TTime);
begin
  FHora := Value;
end;

procedure TReuniao.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TReuniao.SetParticipantes(const Value: String);
begin
  FParticipantes := Value;
end;

end.
