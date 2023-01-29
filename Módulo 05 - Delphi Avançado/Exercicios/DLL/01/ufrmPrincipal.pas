unit ufrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    edtNomePC: TEdit;
    edtNomeUser: TEdit;
    Label2: TLabel;
    edtDirSistema: TEdit;
    Label3: TLabel;
    edtDirWindows: TEdit;
    Label4: TLabel;
    edtDirTemp: TEdit;
    Label5: TLabel;
    edtVersaoWindows: TEdit;
    Label6: TLabel;
    btnInformacoes: TButton;
    procedure btnInformacoesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uInfoPC;

procedure TfrmPrincipal.btnInformacoesClick(Sender: TObject);
begin
  edtNomePC.Text        := TInfoPC.ComputerName;
  edtNomeUser.Text      := TInfoPC.UserName;
  edtDirSistema.Text    := TInfoPC.SystemDirectory;
  edtDirWindows.Text    := TInfoPC.WindowsDirectory;
  edtDirTemp.Text       := TInfoPC.TempPath;
  edtVersaoWindows.Text := TInfoPC.VersionEx;
end;

end.
