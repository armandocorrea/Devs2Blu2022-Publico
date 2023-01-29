unit ufrmDebugger;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmDebugger = class(TForm)
    Label1: TLabel;
    btnProcessar: TButton;
    mmAtalhos: TMemo;
    mmAtalhos2: TMemo;
    procedure btnProcessarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmDebugger: TfrmDebugger;

implementation

uses
  UCalculadora;

{$R *.dfm}

procedure TfrmDebugger.btnProcessarClick(Sender: TObject);
var
  xCalculadora: TCalculadora;
  xResultado: Integer;
begin
  xCalculadora := TCalculadora.Create;
  try
    xResultado := xCalculadora.RetornarSoma(10, 15);

    ShowMessage(xResultado.ToString);
  finally
    FreeAndNil(xCalculadora);
  end;
end;

end.
