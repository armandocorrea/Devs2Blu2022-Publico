unit UVehicle;

interface

type
  TVehicle = class
    private
      FModel: String;

      function GetModel: String;

      procedure SetModel(const aModel: String);
    public
      constructor Create(const aModel: String);

      property Model: String read GetModel write SetModel;
  end;

implementation

{ TVehicle }

constructor TVehicle.Create(const aModel: String);
begin
  FModel := aModel;
end;

function TVehicle.GetModel: String;
begin
  Result := FModel;
end;

procedure TVehicle.SetModel(const aModel: String);
begin
  FModel := aModel;
end;

end.
