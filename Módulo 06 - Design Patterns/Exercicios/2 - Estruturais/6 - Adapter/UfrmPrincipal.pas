unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnConsultar: TButton;
    edtCEP: TEdit;
    Label1: TLabel;
    lblLogradouro: TLabel;
    lblBairro: TLabel;
    lblCidade: TLabel;
    Button1: TButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses
  UInterfaceViaCEP,
  UTarget,
  UAdapter,
  UWebServiceViaCEP,
  UAdaptee;

procedure TfrmPrincipal.btnConsultarClick(Sender: TObject);
var
  xWebServiceViaCEP: IWebServiceViaCEP;
  xComunicador: TComunicador;
  xRetorno: TStringList;
begin
  //Instancia o objeto da classe de consulta
  xWebServiceViaCEP := TWebServiceViaCEP.Create;

  //Instancia o comunicador (Target), injetando o objeto de consulta
  xComunicador := TComunicador.Create(xWebServiceViaCEP);

  xRetorno := TStringList.Create;
  try
    //O Target consulta o endereço (utilizando o objeto injetado) e retorna os dados
    xRetorno := xComunicador.ConsultarEndereco(edtCEP.Text);

    lblLogradouro.Caption := xRetorno.Values['Logradouro'];
    lblBairro.Caption     := xRetorno.Values['Bairro'];
    lblCidade.Caption     := xRetorno.Values['Cidade'];
  finally
    FreeAndNil(xRetorno);
    FreeAndNil(xComunicador);
  end;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  xWebServiceCorreios: TWebServiceCorreios;
  xAdapter: IWebServiceViaCEP;
  xComunicador: TComunicador;
  xRetorno: TStringList;
begin
  //Instancia o objeto de consulta dos Correios (Adaptee)
  xWebServiceCorreios := TWebServiceCorreios.Create;

  //Instancia o Adaptador (Adapter)
  xAdapter := TAdapter.Create(xWebServiceCorreios);

  //Instancia o comunicador (Target), injetando o adaptador
  xComunicador := TComunicador.Create(xAdapter);

  xRetorno := TStringList.Create;
  try
    //O Target consulta o endereço (utilizando o objeto injetado) e retorna os dados
    xRetorno := xComunicador.ConsultarEndereco(edtCEP.Text);

    lblLogradouro.Caption := xRetorno.Values['Logradouro'];
    lblBairro.Caption     := xRetorno.Values['Bairro'];
    lblCidade.Caption     := xRetorno.Values['Cidade'];
  finally
    FreeAndNil(xRetorno);
    FreeAndNil(xComunicador);
    FreeAndNil(xWebServiceCorreios);
  end;

end;

end.
