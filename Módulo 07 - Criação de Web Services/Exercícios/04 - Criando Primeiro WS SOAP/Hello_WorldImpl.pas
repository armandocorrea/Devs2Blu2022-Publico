{ Invokable implementation File for THello_World which implements IHello_World }

unit Hello_WorldImpl;

interface

uses Soap.InvokeRegistry, System.Types, Soap.XSBuiltIns, Hello_WorldIntf;

type

  { THello_World }
  THello_World = class(TInvokableClass, IHello_World)
  public
    function echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
    function echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
    function echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
    function echoDouble(const Value: Double): Double; stdcall;
    function echoHelloWorld: String; stdcall;
  end;

implementation

function THello_World.echoEnum(const Value: TEnumTest): TEnumTest; stdcall;
begin
  { TODO : Implement method echoEnum }
  Result := Value;
end;

function THello_World.echoHelloWorld: String;
begin
  Result := 'Hello World! Devs2Blu2022';
end;

function THello_World.echoDoubleArray(const Value: TDoubleArray): TDoubleArray; stdcall;
begin
  { TODO : Implement method echoDoubleArray }
  Result := Value;
end;

function THello_World.echoMyEmployee(const Value: TMyEmployee): TMyEmployee; stdcall;
begin
  { TODO : Implement method echoMyEmployee }
  Result := Value;
end;

function THello_World.echoDouble(const Value: Double): Double; stdcall;
begin
  { TODO : Implement method echoDouble }
  Result := Value;
end;


initialization
{ Invokable classes must be registered }
   InvRegistry.RegisterInvokableClass(THello_World);
end.

