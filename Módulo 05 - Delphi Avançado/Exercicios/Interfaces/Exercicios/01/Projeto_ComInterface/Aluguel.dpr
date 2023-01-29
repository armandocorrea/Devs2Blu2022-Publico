program Aluguel;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  UUSATaxService in 'model\services\UUSATaxService.pas',
  UCarRental in 'model\entities\UCarRental.pas',
  UInvoice in 'model\entities\UInvoice.pas',
  UVehicle in 'model\entities\UVehicle.pas',
  URentalService in 'model\services\URentalService.pas',
  UTaxService in 'model\services\UTaxService.pas',
  UBrazilTaxService in 'model\services\UBrazilTaxService.pas';

var
  xCarModel: String;
  xStrStart, xStrFinish: String;
  xStart, xFinish: TDateTime;
  xCarRental: TCarRental;
  xStrPricePerHour, xStrPricePerDay: String;
  xPricePerHour, xPricePerDay: Double;
  xRentalService: TRentalService;
begin
  try
    Writeln('Entre com os dados do aluguel:');
    Writeln('Modelo do Carro:');
    Readln(xCarModel);

    Writeln('Retirada (dd/mm/yyyy hh:mm):');
    Readln(xStrStart);
    xStart := StrToDateTime(xStrStart);

    Writeln('Retorno (dd/mm/yyyy hh:mm):');
    Readln(xStrFinish);
    xFinish := StrToDateTime(xStrFinish);

    xCarRental := TCarRental.Create(xStart, xFinish, TVehicle.Create(xCarModel));

    Writeln('Entre com o preço por hora:');
    Readln(xStrPricePerHour);
    xPricePerHour := StrToFloatDef(xStrPricePerHour,0);

    Writeln('Entre com o preço por dia:');
    Readln(xStrPricePerDay);
    xPricePerDay := StrToFloatDef(xStrPricePerDay,0);

    //xRentalService := TRentalService.Create(xPricePerDay, xPricePerHour, TBrazilTaxService.Create);
    xRentalService := TRentalService.Create(xPricePerDay, xPricePerHour, TUSATaxService.Create);
    xRentalService.ProcessInvoice(xCarRental);

    Writeln('FATURA:');
    Writeln('Pagamento básico...: ', xCarRental.Invoice.BasicPayment.ToString);
    Writeln('Imposto............: ', xCarRental.Invoice.Tax.ToString);
    Writeln('Total..............: ', xCarRental.Invoice.TotalPayment.ToString);

    Readln;
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
end.
