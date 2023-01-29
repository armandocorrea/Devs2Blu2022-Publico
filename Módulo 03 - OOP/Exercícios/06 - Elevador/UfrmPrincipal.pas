unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.jpeg,
  Vcl.ExtCtrls, UElevador;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    btnSubir: TButton;
    edtAndar: TEdit;
    lblCapacidade: TLabel;
    lblTotalAndares: TLabel;
    btnDescer: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSubirClick(Sender: TObject);
    procedure btnDescerClick(Sender: TObject);
  private
    { Private declarations }
    FElevador: TElevador;

    procedure Subir;
    procedure Descer;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FreeAndNil(FElevador);
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  xCapacidade,
  xAndares: Byte;
begin
  xCapacidade := StrToIntDef(inputbox('Informe', 'Capacidade de Pessoas?', ''),0);
  xAndares    := StrToIntDef(inputbox('Informe', 'Quantos Andares?', ''),0);

  FElevador := TElevador.Create(xCapacidade, xAndares);

  lblCapacidade.Caption   := 'Cap. ' + FElevador.Capacidade.ToString + ' pessoas';
  lblTotalAndares.Caption := 'T - ' + FormatFloat('00', FElevador.TotalAndares) + ' º andar';
end;

procedure TfrmPrincipal.btnDescerClick(Sender: TObject);
begin
  Self.Descer;
end;

procedure TfrmPrincipal.btnSubirClick(Sender: TObject);
begin
  Self.Subir;
end;

procedure TfrmPrincipal.Descer;
var
  xQtdPessoas,
  xAndar: Byte;
begin
  xQtdPessoas := StrToIntDef(inputbox('Informe', 'Quantas pessoas?', ''),0);
  xAndar      := StrToIntDef(inputbox('Informe', 'Qual andar?', ''),0);

  FElevador.Entrar(xQtdPessoas);
  FElevador.Descer(xAndar);
  FElevador.Sair;

  if FElevador.AndarAtual > 0 then
    edtAndar.Text := FormatFloat('00', FElevador.AndarAtual)
  else
    edtAndar.Text := 'T';
end;

procedure TfrmPrincipal.Subir;
var
  xQtdPessoas,
  xAndar: Byte;
begin
  xQtdPessoas := StrToIntDef(inputbox('Informe', 'Quantas pessoas?', ''),0);
  xAndar      := StrToIntDef(inputbox('Informe', 'Qual andar?', ''),0);

  FElevador.Entrar(xQtdPessoas);
  FElevador.Subir(xAndar);
  FElevador.Sair;

  edtAndar.Text := FormatFloat('00', FElevador.AndarAtual);
end;

end.
