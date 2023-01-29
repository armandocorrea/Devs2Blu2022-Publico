unit URentalService;

interface

uses
  UBrazilTaxService, UCarRental;

type
  TRentalService = class
    private
      FPricePerDay: Double;
      FPricePerHour: Double;

      FTaxService: TBrazilTaxService;
    public
      constructor Create(const aPricePerDay, aPricePerHour: Double; aTaxService: TBrazilTaxService);

      procedure ProcessInvoice(aCarRental: TCarRental);
  end;

implementation

uses
  Math, DateUtils, UInvoice;

{ TRentalService }

constructor TRentalService.Create(const aPricePerDay, aPricePerHour: Double; aTaxService: TBrazilTaxService);
begin
  FPricePerDay  := aPricePerDay;
  FPricePerHour := aPricePerHour;
  FTaxService   := aTaxService;
end;

procedure TRentalService.ProcessInvoice(aCarRental: TCarRental);
var
  xHours: Double;
  xBasicPayment: Double;
  xTax: Double;
begin
  xHours := DateUtils.MilliSecondsBetween(aCarRental.Finish, aCarRental.Start) / 1000 / 60 / 60;

  if xHours <= 12 then
    xBasicPayment := FPricePerHour * Math.Ceil(xHours)
  else
    xBasicPayment := FPricePerDay * Math.Ceil(xHours / 24);

  xTax := FTaxService.Tax(xBasicPayment);

  aCarRental.Invoice := TInvoice.Create(xBasicPayment, xTax);
end;

end.
