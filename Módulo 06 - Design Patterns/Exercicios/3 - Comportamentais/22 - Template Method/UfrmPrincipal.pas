unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Datasnap.DBClient;

type
  TfrmPrincipal = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    edtNome: TEdit;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
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

uses UAbstractClass, UConcreteClassRepositories, UConcreteClassUsers;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  xConcreteClass: TAbstractClass;
begin
  xConcreteClass := nil;

  // Obtém a instância de uma Concrete Class de acordo com o tipo selecionado
  case RadioGroup1.ItemIndex of
    0: xConcreteClass := TConcreteClassRepositories.Create(edtNome.Text);
    1: xConcreteClass := TConcreteClassUsers.Create(edtNome.Text);
  end;

  try
    // Executa o Template Method
    ClientDataSet1.Data := xConcreteClass.ConsultarDadosGitHub;
  finally
    xConcreteClass.Free;
  end;
end;

end.
