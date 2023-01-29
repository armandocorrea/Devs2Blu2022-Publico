unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    cmbMarca: TComboBox;
    btnExibir: TButton;
    GroupBox1: TGroupBox;
    lblTamanhoTela: TLabel;
    lblMemoriaRam: TLabel;
    GroupBox2: TGroupBox;
    lblProcessador: TLabel;
    lblTamanhoHD: TLabel;
    procedure btnExibirClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnExibirClick(Sender: TObject);
begin
  //Dados do Notebook
  if cmbMarca.Items[cmbMarca.ItemIndex] = 'Dell' then
  begin
    lblTamanhoTela.Caption := 'Tela de 14 polegadas';
    lblMemoriaRam.Caption  := '3GB DDR3';
  end
  else if cmbMarca.Items[cmbMarca.ItemIndex] = 'Apple' then
  begin
    lblTamanhoTela.Caption := '11.6 polegadas';
    lblMemoriaRam.Caption  := '4GB DDR3';
  end;

  //Dados do Desktop
  if cmbMarca.Items[cmbMarca.ItemIndex] = 'Dell' then
  begin
    lblProcessador.Caption := 'Intel Core i5';
    lblTamanhoHD.Caption   := '1 TB';
  end
  else if cmbMarca.Items[cmbMarca.ItemIndex] = 'Apple' then
  begin
    lblProcessador.Caption := 'Intel Core i7';
    lblTamanhoHD.Caption   := '500 GB';
  end;
end;

end.
