unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type


  TForm1 = class(TForm)
    cmbAnimal: TComboBox;
    Label1: TLabel;
    btnSom: TButton;
    procedure btnSomClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  UAnimais;

{$R *.DFM}

procedure TForm1.btnSomClick(Sender: TObject);
var
  xAnimal: TAnimal;
begin
  xAnimal := nil;

  try
    case TEnumAnimal(cmbAnimal.ItemIndex) of
      stCachorro:
        xAnimal := TCachorro.Create;
      stGato:
        xAnimal := TGato.Create;
      stPassaro:
        xAnimal := TPassaro.Create;
    end;

    ShowMessage(xAnimal.RetornarSom);
    ShowMessage('Tenho ' + IntToStr(xAnimal.Patas) + ' patas.');
  finally
    FreeAndNil(xAnimal);
  end;
end;

end.
