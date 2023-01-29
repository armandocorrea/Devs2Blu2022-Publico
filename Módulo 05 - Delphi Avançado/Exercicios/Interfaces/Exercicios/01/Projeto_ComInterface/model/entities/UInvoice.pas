unit UInvoice;

interface

type
  TInvoice = class
    private
      FBasicPayment: Double;
      FTax: Double;

      function GetBasicPayment: Double;
      function GetTax: Double;

      procedure SetBasicPayment(const aBasicPayment: Double);
      procedure SetTax(const aTax: Double);
    public
      constructor Create(const aBasicPayment, aTax: Double);

      function TotalPayment: Double;

      property BasicPayment: Double read GetBasicPayment write SetBasicPayment;
      property Tax: Double          read GetTax          write SetTax;
  end;

implementation

{ TInvoice }

constructor TInvoice.Create(const aBasicPayment, aTax: Double);
begin
  FBasicPayment := aBasicPayment;
  FTax          := aTax;
end;

function TInvoice.GetBasicPayment: Double;
begin
  Result := FBasicPayment;
end;

function TInvoice.GetTax: Double;
begin
  Result := FTax;
end;

procedure TInvoice.SetBasicPayment(const aBasicPayment: Double);
begin
  FBasicPayment := aBasicPayment;
end;

procedure TInvoice.SetTax(const aTax: Double);
begin
  FTax := aTax
end;

function TInvoice.TotalPayment: Double;
begin
  Result := GetBasicPayment + GetTax;
end;

end.
