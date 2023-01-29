unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtNumero: TEdit;
    btnTabuada: TButton;
    procedure btnTabuadaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnTabuadaClick(Sender: TObject);
var
  //Declarando a variável "xArq" do tipo arquivo texto
  xArq: TextFile;
  i, n: Integer;
begin
  try
    //Associa a variável do programa "xArq" ao arquivo externo "tabuada.txt" na unidade de disco "d"
    AssignFile(xArq, 'Tabuada.txt');
    //Cria o arquivo "tabuada.txt" na unidade de disco "d"
    Rewrite(xArq);

    n := StrToIntDef(edtNumero.Text,0);

    //Grava uma linha no arquivo
    Writeln(xArq, '+--Resultado--+');

    for I := 1 to 10 do
    begin
      //Grava uma linha da tabuada no arquivo
      Writeln(xArq, '| ', i, ' X ', n, ' = ', (i*n), ' |');
    end;

    //Grava uma linha no arquivo
    Writeln(xArq, '+-------------+');

    ShowMessage('Tabuada gravada com sucesso!');
  finally
    //Fecha o aquivo texto
    CloseFile(xArq);
  end;
end;

end.
