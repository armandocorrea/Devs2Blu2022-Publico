// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://localhost:9090/wsdl/IHello_World
//  >Import : http://localhost:9090/wsdl/IHello_World>0
// Codegen  : [wfForceSOAP11+, wfForceSOAP12+]
// Version  : 1.0
// (02/02/2023 21:39:12 - - $Rev: 103843 $)
// ************************************************************************ //

unit IHello_World1;

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
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:double          - "http://www.w3.org/2001/XMLSchema"[Gbl]

  TMyEmployee          = class;                 { "urn:Hello_WorldIntf"[GblCplx] }

  {$SCOPEDENUMS ON}
  { "urn:Hello_WorldIntf"[GblSmpl] }
  TEnumTest = (etNone, etAFew, etSome, etAlot);

  {$SCOPEDENUMS OFF}



  // ************************************************************************ //
  // XML       : TMyEmployee, global, <complexType>
  // Namespace : urn:Hello_WorldIntf
  // ************************************************************************ //
  TMyEmployee = class(TRemotable)
  private
    FLastName: string;
    FFirstName: string;
    FSalary: Double;
  published
    property LastName:  string  read FLastName write FLastName;
    property FirstName: string  read FFirstName write FFirstName;
    property Salary:    Double  read FSalary write FSalary;
  end;

  TDoubleArray = array of Double;               { "urn:Hello_WorldIntf"[GblCplx] }

  // ************************************************************************ //
  // Namespace : http://tempuri.org/
  // style     : ????
  // use       : ????
  // binding   : IHello_Worldbinding
  // service   : IHello_Worldservice
  // port      : IHello_WorldPort
  // ************************************************************************ //
  IHello_World = interface(IInvokable)
  ['{F81D211F-CA0A-4146-2BB5-17FE53E8506A}']
    function  echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function  echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function  echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function  echoDouble(const Value: Double): Double; stdcall;
    function  echoHelloWorld: string; stdcall;
  end;

function GetIHello_World(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): IHello_World;


implementation
  uses System.SysUtils;

function GetIHello_World(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): IHello_World;
const
  defWSDL = 'http://localhost:9090/wsdl/IHello_World';
  defURL  = 'http://localhost:9090/soap/IHello_World';
  defSvc  = 'IHello_Worldservice';
  defPrt  = 'IHello_WorldPort';
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
    Result := (RIO as IHello_World);
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
  { IHello_World }
  InvRegistry.RegisterInterface(TypeInfo(IHello_World), 'http://tempuri.org/', '');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(IHello_World), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(IHello_World), ioSOAP12);
  RemClassRegistry.RegisterXSInfo(TypeInfo(TEnumTest), 'urn:Hello_WorldIntf', 'TEnumTest');
  RemClassRegistry.RegisterXSClass(TMyEmployee, 'urn:Hello_WorldIntf', 'TMyEmployee');
  RemClassRegistry.RegisterXSInfo(TypeInfo(TDoubleArray), 'urn:Hello_WorldIntf', 'TDoubleArray');

end.