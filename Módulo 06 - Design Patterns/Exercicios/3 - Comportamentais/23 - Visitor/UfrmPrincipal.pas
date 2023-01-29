unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls, UConcrete_Element_Funcionario,
  Generics.Collections, Data.Bind.Components, Data.Bind.ObjectScope,
  Data.Bind.EngExt, Vcl.Bind.DBEngExt, Vcl.Bind.Grid, System.Rtti,
  System.Bindings.Outputs, Vcl.Bind.Editors, Data.Bind.Grid;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Shape1: TShape;
    btnAdicionar: TButton;
    edtNome: TEdit;
    edtSalario: TEdit;
    cmbFuncao: TComboBox;
    edtAdmissao: TDateTimePicker;
    Panel1: TPanel;
    Button1: TButton;
    Button2: TButton;
    AdapterBindSource: TAdapterBindSource;
    StringGrid1: TStringGrid;
    BindingsList: TBindingsList;
    LinkGridToDataSourceAdapterBindSource: TLinkGridToDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure AdapterBindSourceCreateAdapter(Sender: TObject;
      var ABindSourceAdapter: TBindSourceAdapter);
  private
    { Private declarations }
    FObjectStructure: TObjectList<TFuncionario>;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UConcrete_Element_Gerente, UConcrete_Element_Programador, System.SysUtils,
  UInterface_Visitor, UConcrete_Visitor_Salario, UConcrete_Visitor_Senioridade;

procedure TfrmPrincipal.AdapterBindSourceCreateAdapter(Sender: TObject;
  var ABindSourceAdapter: TBindSourceAdapter);
begin
  // Cria o adaptador para usar o LiveBindings na TStringGrid com o Object Structure
  ABindSourceAdapter := TListBindSourceAdapter<TFuncionario>.Create(Self, FObjectStructure);
end;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
var
  xElement: TFuncionario;
begin
  xElement := nil;

  // Cria o Concrete Element (Programador ou Gerente) conforme seleção na TComboBox
  case cmbFuncao.ItemIndex of
    0:
      xElement := TProgramador.Create;
    1:
      xElement := TGerente.Create;
  end;

  // Preenche os dados do objeto
  xElement.Nome     := edtNome.Text;
  xElement.Funcao   := cmbFuncao.Text;
  xElement.Admissao := edtAdmissao.Date;
  xElement.Salario  := StrToFloatDef(edtSalario.Text, 0);

  // Adiciona na Object Structure (lista de objetos)
  FObjectStructure.Add(xElement);

  // Atualiza o adaptador para exibir as alterações na TStringGrid
  AdapterBindSource.Refresh;
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
var
  xVisitor: IVisitor;
  xElement: TFuncionario;
begin
  // Cria uma instância do Concrete Visitor referente ao aumento de salário
  xVisitor := TSalario.Create;

  // Chama o método Accept para executar a operação em cada elemento da Object Structure
  for xElement in FObjectStructure do
  begin
    xElement.Accept(xVisitor);
  end;

  // Atualiza o adaptador para exibir as alterações na TStringGrid
  AdapterBindSource.Refresh;
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
var
  xVisitor: IVisitor;
  xElement: TFuncionario;
begin
  // Cria uma instância do Concrete Visitor referente à definição da senioridade
  xVisitor := TSenioridade.Create;

  // Chama o método Accept para executar a operação em cada elemento da Object Structure
  for xElement in FObjectStructure do
  begin
    xElement.Accept(xVisitor);
  end;

  // Atualiza o adaptador para exibir as alterações na TStringGrid
  AdapterBindSource.Refresh;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //FObjectStructure.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
var
  xAdapter: TListBindSourceAdapter<TFuncionario>;
begin
  // Cria a instância do Object Structure
  FObjectStructure := TObjectList<TFuncionario>.Create;

  // Descomentar a linha abaixo para trabalhar com dados de exemplo
  //PreencherDadosFictícios;

  // Configura o LiveBindings para trabalhar com o Object Structure
  xAdapter := TListBindSourceAdapter<TFuncionario>(AdapterBindSource.InternalAdapter);
  xAdapter.SetList(FObjectStructure);
  xAdapter.Active := True;
end;

end.
