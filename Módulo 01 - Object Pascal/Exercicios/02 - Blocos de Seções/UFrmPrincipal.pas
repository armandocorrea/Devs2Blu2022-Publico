unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TForm6 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

uses
  USecoes;

{$R *.dfm}

procedure TForm6.Button1Click(Sender: TObject);
var
  xCachorro: TCachorro;
begin
  xCachorro := TCachorro.Create;

  try
    xCachorro.MeuSomEh;
  finally
    FreeAndNil(xCachorro);
  end;
end;

end.
