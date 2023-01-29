unit uFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtArquivo: TEdit;
    btnLeitura: TButton;
    mmArquivo: TMemo;
    procedure btnLeituraClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnLeituraClick(Sender: TObject);
var
  xArq: TextFile;
  xLinha: String;
begin
  mmArquivo.Clear;
  try
    AssignFile(xArq, edtArquivo.Text);

    {$I-} //Desativa a Diretiva de Input

    //Abre o arquivo para a leitura
    Reset(xArq);

    if IOResult <> 0 then
      raise Exception.Create('Erro na abertura do arquivo !!!');

    {$I+} //Ativa a Diretiva de Input

    //Verifica se o arquivo atingiu a marca de final de arquivo
    while (not eof(xArq)) do
    begin
      //Lê uma linha do arquivo
      Readln(xArq, xLinha);

      mmArquivo.Lines.Add(xLinha);
    end;
  finally
    CloseFile(xArq);
  end;
end;

end.
