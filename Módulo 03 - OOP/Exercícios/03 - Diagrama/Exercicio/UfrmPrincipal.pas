unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TEnumPessoa = (tpFisica, tpJuridica);

  TfrmPrincipal = class(TForm)
    rgPessoa: TRadioGroup;
    edtNome: TEdit;
    edtEndereco: TEdit;
    edtCEP: TEdit;
    edtTelefone: TEdit;
    edtRenda: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    lblDocumento: TLabel;
    edtDocumento: TEdit;
    btnGravar: TButton;
    cmbSituacao: TComboBox;
    procedure rgPessoaClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    { Private declarations }
    procedure GravarDados;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UPessoa;

{$R *.dfm}

procedure TfrmPrincipal.btnGravarClick(Sender: TObject);
begin
  Self.GravarDados;
end;

procedure TfrmPrincipal.GravarDados;
var
  xPessoa: TPessoa;
begin
  xPessoa := nil;

  case TEnumPessoa(rgPessoa.ItemIndex) of
    tpFisica:
    begin
      xPessoa := TPessoaFisica.Create;
    end;

    tpJuridica:
    begin
      xPessoa := TPessoaJuridica.Create;
    end;
  end;

  try
    try
      xPessoa.Nome     := edtNome.Text;
      xPessoa.Endereco := edtEndereco.Text;
      xPessoa.CEP      := edtCEP.Text;
      xPessoa.Telefone := edtTelefone.Text;
      xPessoa.Renda    := StrToCurrDef(edtRenda.Text, 0);
      xPessoa.Situacao := rgPessoa.ItemIndex;

      //Pessoa Fisica
      if xPessoa is TPessoaFisica then
        TPessoaFisica(xPessoa).CPF := edtDocumento.Text;

      //Pessoa Juridica
      if xPessoa is TPessoaJuridica then
        TPessoaJuridica(xPessoa).CNPJ := edtDocumento.Text;

      //Uso do Polimorfismo
      xPessoa.RegistrarPessoa;
    except
      on E: Exception do
        raise Exception.Create('Erro ao gravar os dados: ' + E.Message);
    end;
  finally
    FreeAndNil(xPessoa);
  end;
end;

procedure TfrmPrincipal.rgPessoaClick(Sender: TObject);
begin
  if TEnumPessoa(rgPessoa.ItemIndex) = tpFisica then
    lblDocumento.Caption := 'CPF'
  else
    lblDocumento.Caption := 'CNPJ';
end;

end.
