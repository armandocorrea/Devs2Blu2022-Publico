unit UPrincipal;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, ExtCtrls;

type
  TEnumNivel = (stEstagiario, stJunior, stPleno, stSenior);

  TForm1 = class(TForm)
    Label1: TLabel;
    btnIf: TButton;
    btnCase: TButton;
    edtInput: TEdit;
    rgNivel: TRadioGroup;
    procedure btnIfClick(Sender: TObject);
    procedure btnCaseClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

procedure TForm1.btnIfClick(Sender: TObject);
const
  C_MEU_MOME = 'ARMANDO';
begin
  if (edtInput.Text = C_MEU_MOME) then
    ShowMessage('Sou eu. Presente.')
  else
    ShowMessage('Não sou eu.');
end;

procedure TForm1.btnCaseClick(Sender: TObject);
var
  xMensagem: String;
  xColaborador: String;
begin
  xColaborador := edtInput.Text;
  xMensagem    := 'Eu ' + xColaborador + ' sou do nível ';

  case TEnumNivel(rgNivel.ItemIndex) of
    stEstagiario:
      xMensagem := xMensagem + 'Estagiário.';
    stJunior:
      xMensagem := xMensagem + 'Júnior.';
    stPleno:
      xMensagem := xMensagem + 'Pleno.';
    stSenior:
      xMensagem := xMensagem + 'Sênior.';
    else
      xMensagem := 'Opção inválida.';
  end;

  ShowMessage(xMensagem);
end;

end.
