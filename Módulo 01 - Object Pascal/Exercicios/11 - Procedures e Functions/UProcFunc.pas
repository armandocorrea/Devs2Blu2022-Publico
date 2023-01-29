unit UProcFunc;

interface

implementation

uses
  Dialogs;

/////PROCEDURES E FUNCTIONS/////

// Isso é uma procedure
procedure OlaMundo;
begin
  ShowMessage('Olá Mundo!!!');
end;

// Isso é uma função
function RetornarNomeSobrenome: String;
begin
  Result := 'Armando Neto';
end;

// Procedure com parametros por Referencia
procedure DoubleTheValue(var Value: Integer);
begin
  Value := Value * 2;
end;

// Parametros Constantes
function DoubleTheValue2(const Value: Integer): Integer;
begin
  //Value  := Value * 2; //compiler error
  Result := Value;
end;

// Parametros Default
procedure NewMessage(aMsg: String; aCaption: String = 'Message'; aSeparator: String = SLineBreak);
var
  xMensagem: String;
begin
  xMensagem := aCaption;
  xMensagem := xMensagem + ': ';
  xMensagem := xMensagem + aMsg;
  xMensagem := xMensagem + aSeparator;

  ShowMessage(xMensagem);
end;

end.
