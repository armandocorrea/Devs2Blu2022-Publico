unit UfrmProceduresFunctions;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmProceduresFunctions = class(TForm)
    btnProcedure: TButton;
    btnFunction: TButton;
    btnReferencia: TButton;
    btnConstante: TButton;
    btnArrayAberto: TButton;
    btnSobrecarga: TButton;
    btnDefault: TButton;
    btnForward: TButton;
    procedure btnProcedureClick(Sender: TObject);
    procedure btnFunctionClick(Sender: TObject);
    procedure btnReferenciaClick(Sender: TObject);
    procedure btnConstanteClick(Sender: TObject);
    procedure btnDefaultClick(Sender: TObject);
    procedure btnArrayAbertoClick(Sender: TObject);
    procedure btnSobrecargaClick(Sender: TObject);
    procedure btnForwardClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProceduresFunctions: TfrmProceduresFunctions;

implementation

{$R *.dfm}

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

// Parametros com Array Aberto
function Sum(const A: Array of Integer): Integer;
var
  I: Integer;
begin
  Result := 0;

  for I := Low (A) to High(A) do
    Result := Result + A[I];
end;

// Sobrecarga de Funções
function Min(A, B: Integer): Integer; overload;
begin
  Result := A;
  if B < A then
    Result := B;
end;

function Min(A, B: Double): Double; overload;
begin
  Result := A;
  if B < A then
    Result := B;
end;

function Min(A, B: Extended): Extended; overload;
begin
  Result := A;
  if B < A then
    Result := B;
end;

// Declaração Forward
procedure Hello; forward;
procedure DoubleHello; forward;

procedure Hello;
begin
  if MessageDlg('Do you want a double message?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    DoubleHello
  else
    ShowMessage('Hello');
end;

procedure DoubleHello;
begin
  Hello;
  Hello;
end;


{ TfrmProceduresFunctions }

procedure TfrmProceduresFunctions.btnArrayAbertoClick(Sender: TObject);
var
  xSoma: Integer;
begin
  xSoma := Sum([1,2,3]);

  ShowMessage(xSoma.ToString);
end;

procedure TfrmProceduresFunctions.btnConstanteClick(Sender: TObject);
var
  x: Integer;
begin
  x := 10;
  DoubleTheValue2(x);
  ShowMessage(x.ToString);
end;

procedure TfrmProceduresFunctions.btnForwardClick(Sender: TObject);
begin
  DoubleHello;
end;

procedure TfrmProceduresFunctions.btnFunctionClick(Sender: TObject);
var
  xNomeSobreNome: String;
begin
  xNomeSobreNome := RetornarNomeSobrenome;
  ShowMessage(xNomeSobreNome);
end;

procedure TfrmProceduresFunctions.btnProcedureClick(Sender: TObject);
begin
  OlaMundo;
end;

procedure TfrmProceduresFunctions.btnReferenciaClick(Sender: TObject);
var
  x: Integer;
begin
  x := 10;
  DoubleTheValue(x);
  ShowMessage(x.ToString);
end;

procedure TfrmProceduresFunctions.btnSobrecargaClick(Sender: TObject);
var
  xNum1, xNum2: Integer;
  xNum3, xNum4: Double;
  xNum5, xNum6: Extended;
begin
  xNum1 := 1; xNum2 := 2;
  xNum3 := 1; xNum4 := 2;
  xNum5 := 1; xNum6 := 2;

  Min(xNum1, xNum2);
  Min(xNum3, xNum4);
  Min(xNum5, xNum6);
end;

procedure TfrmProceduresFunctions.btnDefaultClick(Sender: TObject);
begin
  NewMessage('Something wrong here!');
  NewMessage('Something wrong here!', 'Attention');
  NewMessage('Hello', 'Message', '--');
end;

end.
