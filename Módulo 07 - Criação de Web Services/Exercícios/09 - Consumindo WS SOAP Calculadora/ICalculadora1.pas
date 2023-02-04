// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9090/wsdl/ICalculadora
// Codegen  : [wfForceSOAP11+, wfForceSOAP12+]
// Version  : 1.0
// (02/02/2023 22:00:14 - - $Rev: 103843 $)
// ************************************************************************ //

unit ICalculadora1;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:double          - "http://www.w3.org/2001/XMLSchema"[]


  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // style     : ????
  // use       : ????
  // binding   : ICalculadorabinding
  // service   : ICalculadoraservice
  // port      : ICalculadoraPort
  // ************************************************************************ //
  ICalculadora = interface(IInvokable)
  ['{E66E1709-D4FD-53FF-B516-9DF0139B4A7B}']
    function  Somar(const aValor1: Double; const aValor2: Double): Double; stdcall;
    function  Subtrair(const aValor1: Double; const aValor2: Double): Double; stdcall;
    function  Multiplicar(const aValor1: Double; const aValor2: Double): Double; stdcall;
    function  Dividir(const aValor1: Double; const aValor2: Double): Double; stdcall;
  end;

function GetICalculadora(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): ICalculadora;


implementation
  uses System.SysUtils;

function GetICalculadora(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): ICalculadora;
const
  defWSDL = 'http://localhost:9090/wsdl/ICalculadora';
  defURL  = 'http://localhost:9090/soap/ICalculadora';
  defSvc  = 'ICalculadoraservice';
  defPrt  = 'ICalculadoraPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as ICalculadora);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


initialization
  { ICalculadora }
  InvRegistry.RegisterInterface(TypeInfo(ICalculadora), 'http://tempuri.org/', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(ICalculadora), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(ICalculadora), ioSOAP12);

end.