unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UInterface_Mediator;

type
  TfrmPrincipal = class(TForm)
    btnNovo: TButton;
    btnRemover: TButton;
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Memo1: TMemo;
    cmbRemetente: TComboBox;
    cmbDestinatario: TComboBox;
    Label2: TLabel;
    Label3: TLabel;
    edtMensagem: TEdit;
    btnEnviar: TButton;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    FMediator: IMediator;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UConcrete_Mediator, UInterface_Colleague, UConcrete_Colleague;

procedure TfrmPrincipal.btnEnviarClick(Sender: TObject);
var
  xRemetente: IColleague;
begin
  xRemetente := FMediator.ObterMembro(cmbRemetente.Text);

  Memo1.Lines.Add(xRemetente.EnviarProposta(
    cmbDestinatario.Text, edtMensagem.Text
  ));
end;

procedure TfrmPrincipal.btnNovoClick(Sender: TObject);
var
  xMembro: IColleague;
begin
  xMembro := TConcreteColleague.Create(
    InputBox('Membro', 'Nome do Membro', ''),
    FMediator
  );

  Memo1.Lines.Add(xMembro.Entrar);

  ListBox1.Items.Add(xMembro.ObterNome);
  cmbRemetente.Items.Add(xMembro.ObterNome);
  cmbDestinatario.Items.Add(xMembro.ObterNome);
end;

procedure TfrmPrincipal.btnRemoverClick(Sender: TObject);
var
  xMembro: IColleague;
begin
  xMembro := FMediator.ObterMembro(
    ListBox1.Items[ListBox1.ItemIndex]
  );

  ListBox1.Items.Delete(ListBox1.Items.IndexOf(xMembro.ObterNome));
  cmbRemetente.Items.Delete(cmbRemetente.Items.IndexOf(xMembro.ObterNome));
  cmbDestinatario.Items.Delete(cmbDestinatario.Items.IndexOf(xMembro.ObterNome));

  Memo1.Lines.Add(xMembro.Sair);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FMediator.LiberarObjetos;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FMediator := TConcreteMediator.Create;
end;

end.
