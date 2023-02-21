unit UEntity.Teams;

interface

uses
  GBSwagger.Model.Attributes,
  System.JSON;

type
  TTeam = class
    private
      FId: Integer;
      FName: String;
      FJSON: TJSONObject;

      function GetId: Integer;
      function GetName: String;
      function GetJSON: TJSONObject;

      procedure SetId(const Value: Integer);
      procedure SetName(const Value: String);
    public
      constructor Create; overload;
      constructor Create(const aId: Integer); overload;
      constructor Create(const aName: String); overload;
      constructor Create(const aId: Integer; aName: String); overload;

      destructor  Destroy; override;

      //Padrão de Projeto - Prototype
      function Clone: TTeam;

      [SwagProp('Time Id', True)]
      property Id: Integer read GetId write SetId;

      [SwagProp('Time Nome', True)]
      property Name: String read GetName write SetName;

      property JSON: TJSONObject read GetJSON;
  end;

implementation

uses
  System.SysUtils;

{ TTeam }

constructor TTeam.Create;
begin
  FJSON := TJSONObject.Create;
end;

constructor TTeam.Create(const aId: Integer);
begin
  FId := aId;

  Self.Create;
end;

function TTeam.Clone: TTeam;
begin
  Result := TTeam.Create;

  Result.FId   := Self.FId;
  Result.FName := Self.FName
end;

constructor TTeam.Create(const aName: String);
begin
  FName := aName;

  Self.Create;
end;

constructor TTeam.Create(const aId: Integer; aName: String);
begin
  FId   := aId;
  FName := aName;

  Self.Create;
end;

destructor TTeam.Destroy;
begin
  FreeAndNil(FJSON);
  inherited;
end;

function TTeam.GetId: Integer;
begin
  Result := FId;
end;

function TTeam.GetJSON: TJSONObject;
begin
  FJSON.AddPair('name', FName);

  Result := FJSON;
end;

function TTeam.GetName: String;
begin
  Result := FName;
end;

procedure TTeam.SetId(const Value: Integer);
begin
  FId := Value;
end;

procedure TTeam.SetName(const Value: String);
begin
  FName := Value;
end;

end.
