unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Samples.Spin, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtTexto: TEdit;
    btnMaiusculas: TButton;
    btnMinusculas: TButton;
    Label2: TLabel;
    Label3: TLabel;
    edtNumero: TSpinEdit;
    edtTextoConvertido: TEdit;
    btnConverter: TButton;
    procedure btnMaiusculasClick(Sender: TObject);
    procedure btnMinusculasClick(Sender: TObject);
    procedure btnConverterClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  //Carregando a funções implicitamente da dll

  function MeuUpperCase(s: ShortString): ShortString; stdcall;
    external 'MinhaDll.Dll' name 'MeuUpperCase';

  function MeuLowerCase(s: ShortString): ShortString; stdcall;
    external 'MinhaDll.Dll' name 'MeuLowerCase';

  function MeuIntToStr(Numero: Integer): ShortString; stdcall;
    external 'MinhaDll.Dll' name 'MeuIntToStr';

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnConverterClick(Sender: TObject);
begin
  edtTextoConvertido.Text := MeuIntToStr(edtNumero.Value);
end;

procedure TfrmPrincipal.btnMaiusculasClick(Sender: TObject);
begin
  edtTexto.Text := MeuUpperCase(edtTexto.Text);
end;

procedure TfrmPrincipal.btnMinusculasClick(Sender: TObject);
begin
  edtTexto.Text := MeuLowerCase(edtTexto.Text);
end;

end.
