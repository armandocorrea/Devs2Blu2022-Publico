unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TDias = (Segunda, Terca, Quarta, Quinta, Sexta, Sabado, Domingo);
  TMes  = (Janeiro, Fevereiro, Marco, Abril, Maio, Junho, Julho);

  TEnumUtils<T> = class
    class procedure EnumToList(aValue: TStrings);
  end;

  TForm6 = class(TForm)
    ComboBox1: TComboBox;
    btnMes: TButton;
    btnDia: TButton;
    procedure btnMesClick(Sender: TObject);
    procedure btnDiaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses
  System.TypInfo;

{$R *.dfm}

{ TEnumUtils<T> }

class procedure TEnumUtils<T>.EnumToList(aValue: TStrings);
var
  I, xPos: Integer;
  xAux: String;
begin
  aValue.Clear;
  I := 0;
  repeat
    xAux := GetEnumName(TypeInfo(T), I);
    xPos := GetEnumValue(TypeInfo(T), xAux);

    if xPos <> -1 then
      aValue.Add(xAux);

    Inc(I);
  until xPos < 0;
end;

procedure TForm6.btnDiaClick(Sender: TObject);
begin
  TEnumUtils<TDias>.EnumToList(ComboBox1.Items);
end;

procedure TForm6.btnMesClick(Sender: TObject);
begin
  TEnumUtils<TMes>.EnumToList(ComboBox1.Items);
end;

end.
