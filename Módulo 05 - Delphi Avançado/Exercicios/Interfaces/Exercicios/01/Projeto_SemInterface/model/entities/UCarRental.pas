unit UCarRental;

interface

uses
  UVehicle, UInvoice;

type
  TCarRental = class
    private
      FStart: TDateTime;
      FFinish: TDateTime;

      FVehicle: TVehicle;
      FInvoice: TInvoice;

      function GetFinish: TDateTime;
      function GetInvoice: TInvoice;
      function GetStart: TDateTime;
      function GetVehicle: TVehicle;

      procedure SetFinish(const aFinish: TDateTime);
      procedure SetInvoice(const aInvoice: TInvoice);
      procedure SetStart(const aStart: TDateTime);
      procedure SetVehicle(const aVehicle: TVehicle);
    public
      constructor Create(const aStart, aFinish: TDateTime; aVehicle: TVehicle);

      property Start: TDateTime  read GetStart   write SetStart;
      property Finish: TDateTime read GetFinish  write SetFinish;
      property Vehicle: TVehicle read GetVehicle write SetVehicle;
      property Invoice: TInvoice read GetInvoice write SetInvoice;
  end;

implementation

{ TCarRental }

constructor TCarRental.Create(const aStart, aFinish: TDateTime; aVehicle: TVehicle);
begin
  FStart   := aStart;
  FFinish  := aFinish;
  FVehicle := aVehicle;
end;

function TCarRental.GetFinish: TDateTime;
begin
  Result := FFinish;
end;

function TCarRental.GetInvoice: TInvoice;
begin
  Result := FInvoice;
end;

function TCarRental.GetStart: TDateTime;
begin
  Result := FStart;
end;

function TCarRental.GetVehicle: TVehicle;
begin
  Result := FVehicle;
end;

procedure TCarRental.SetFinish(const aFinish: TDateTime);
begin
  FFinish := aFinish;
end;

procedure TCarRental.SetInvoice(const aInvoice: TInvoice);
begin
  FInvoice := aInvoice;
end;

procedure TCarRental.SetStart(const aStart: TDateTime);
begin
  FStart := aStart;
end;

procedure TCarRental.SetVehicle(const aVehicle: TVehicle);
begin
  FVehicle := aVehicle;
end;

end.
