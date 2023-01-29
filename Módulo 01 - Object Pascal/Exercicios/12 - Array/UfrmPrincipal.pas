unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDayTemperatures = array [1..31] of Integer;
  //TMonthTemps = array [1..31] of TDayTemperatures;
  //TMatrizDinamica = array of string;

  TForm6 = class(TForm)
    edtDia: TEdit;
    edtTemperatura: TEdit;
    Button1: TButton;
    Button2: TButton;
    mmHistorico: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    FDayTemperatures: TDayTemperatures;
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
  xDia: Integer;
  xTemperatura: Integer;
begin
  xDia := StrToIntDef(edtDia.Text, 0);
  xTemperatura := StrToIntDef(edtTemperatura.Text, 0);

  FDayTemperatures[xDia] := xTemperatura;
end;

procedure TForm6.Button2Click(Sender: TObject);
var
  I: Integer;
begin
  mmHistorico.Lines.Clear;

  for I := 1 to Length(FDayTemperatures) do
  begin
    if FDayTemperatures[I] > 0 then
      mmHistorico.Lines.Add('Dia ' + IntToStr(I) +
                            ' fez ' + IntToStr(FDayTemperatures[I]) +
                            ' graus.');
  end;
end;

end.
