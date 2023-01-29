unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, uPaciente;

type
  TfrmPrincipal = class(TForm)
    Image1: TImage;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edtCPF: TEdit;
    edtEspecialidade: TEdit;
    btnSalvar: TButton;
    Image2: TImage;
    Panel2: TPanel;
    Shape1: TShape;
    Shape3: TShape;
    Label3: TLabel;
    Label4: TLabel;
    Shape2: TShape;
    Shape4: TShape;
    lblPacienteAnterior: TLabel;
    lblEspecialidadeAnterior: TLabel;
    lblPacienteAtual: TLabel;
    lblEspecialidadeAtual: TLabel;
    Sair: TButton;
    Label6: TLabel;
    edtPaciente: TEdit;
    btnProximo: TButton;
    Shape5: TShape;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure SairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnProximoClick(Sender: TObject);
  private
    { Private declarations }
    FListaPaciente: TListaPaciente;

    procedure PrepararLabels;
    procedure LimparCampos;
    procedure NovoPaciente;
    procedure Proximo;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Proximo;
var
  xPaciente: TPaciente;
begin
  xPaciente := FListaPaciente.Proximo;
  if Assigned(xPaciente) then
  begin
    if Assigned(FListaPaciente.PacienteAnterior) and
       (FListaPaciente.PacienteAnterior <> xPaciente) then
    begin
      lblPacienteAnterior.Caption      := FListaPaciente.PacienteAnterior.Nome;
      lblEspecialidadeAnterior.Caption := FListaPaciente.PacienteAnterior.Especialidade;
    end;

    lblPacienteAtual.Caption      := xPaciente.Nome;
    lblEspecialidadeAtual.Caption := xPaciente.Especialidade;
  end;
end;

procedure TfrmPrincipal.btnProximoClick(Sender: TObject);
begin
  Self.Proximo;
end;

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
begin
  Self.NovoPaciente;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
  frmPrincipal := nil;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaPaciente := TListaPaciente.Create;
  Self.PrepararLabels;
end;

procedure TfrmPrincipal.LimparCampos;
begin
  edtCPF.Text           := EmptyStr;
  edtPaciente.Text      := EmptyStr;
  edtEspecialidade.Text := EmptyStr;
end;

procedure TfrmPrincipal.NovoPaciente;
var
  xPaciente: TPaciente;
begin
  xPaciente := TPaciente.Create(edtCPF.Text,
                                edtPaciente.Text,
                                edtEspecialidade.Text);

  FListaPaciente.Adicionar(xPaciente);
  Self.LimparCampos;
end;

procedure TfrmPrincipal.PrepararLabels;
begin
  lblPacienteAnterior.Caption := '-';
  lblPacienteAtual.Caption    := '-';

  lblEspecialidadeAnterior.Caption := '-';
  lblEspecialidadeAtual.Caption    := '-';
end;

procedure TfrmPrincipal.SairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
