unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TEnumMes = (stNenhum, stJaneiro, stFevereiro, stMarco, stAbril, stMaio, stJunho,
              stJulho, stAgosto, stSetembro, stOutubro, stNovembro, stDezembro);

  TForm1 = class(TForm)
    Label1: TLabel;
    edtInput: TEdit;
    Label2: TLabel;
    btnStrToInt: TButton;
    bntStrToFloat: TButton;
    btnStrToDateTime: TButton;
    btnDateExt: TButton;
    lblResultado: TLabel;
    procedure btnStrToIntClick(Sender: TObject);
    procedure bntStrToFloatClick(Sender: TObject);
    procedure btnStrToDateTimeClick(Sender: TObject);
    procedure btnDateExtClick(Sender: TObject);
  private
    { Private declarations }
    function RetornarMesPorExtenso(const aMes: Word): String;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnStrToIntClick(Sender: TObject);
var
  xValorInteiro: Integer;
  xValorString: String;
begin
  xValorString := edtInput.Text;

  xValorInteiro := StrToIntDef(xValorString,0);
  xValorInteiro := xValorInteiro + 10;

  xValorString := IntToStr(xValorInteiro);

  lblResultado.Caption := xValorString;
end;

procedure TForm1.bntStrToFloatClick(Sender: TObject);
var
  xValorFlutuante: Double;
  xValorString: String;
begin
  xValorString := edtInput.Text;

  xValorFlutuante := StrToFloat(xValorString);
  xValorFlutuante := xValorFlutuante + 10.50;

  xValorString := FloatToStr(xValorFlutuante);

  lblResultado.Caption := xValorString;
end;

procedure TForm1.btnStrToDateTimeClick(Sender: TObject);
var
  xValorData: TDate;
  xValorString: String;
begin
  xValorString := edtInput.Text;

  xValorData := StrToDate(xValorString);
  xValorData := xValorData + 2;

  xValorString := DateToStr(xValorData);

  lblResultado.Caption := xValorString;
end;

procedure TForm1.btnDateExtClick(Sender: TObject);
var
  xDia, xMes, xAno: Word;
  xMesExtenso: String;
  xValorData: TDate;
  xValorString: String;
begin
  xValorString := edtInput.Text;

  xValorData := StrToDate(xValorString);

  DecodeDate(xValorData, xAno, xMes, xDia);
  xMesExtenso := RetornarMesPorExtenso(xMes);

  xValorString := 'Hoje é dia ' + IntToStr(xDia) + ' de ' +
        xMesExtenso + ' de ' + IntToStr(xAno);

  lblResultado.Caption := xValorString;
end;

function TForm1.RetornarMesPorExtenso(const aMes: Word): string;
begin
  Result := '';

  case TEnumMes(aMes) of
    stJaneiro:
      Result := 'Janeiro';
    stFevereiro:
      Result := 'Fevereiro';
    stMarco:
      Result := 'Março';
    stAbril:
      Result := 'Abril';
    stMaio:
      Result := 'Maio';
    stJunho:
      Result := 'Junho';
    stJulho:
      Result := 'Julho';
    stAgosto:
      Result := 'Agosto';
    stSetembro:
      Result := 'Setembro';
    stOutubro:
      Result := 'Outubro';
    stNovembro:
      Result := 'Novembro';
    stDezembro:
      Result := 'Dezembro';
  end;
end;

end.
