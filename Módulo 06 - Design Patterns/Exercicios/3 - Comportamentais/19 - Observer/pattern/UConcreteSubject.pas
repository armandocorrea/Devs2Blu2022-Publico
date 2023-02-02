unit UConcreteSubject;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Datasnap.DBClient,

  Generics.Collections,
  USubject, UObserver;

type
  TfraCadastro = class(TFrame, ISubject)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    cmbOperacao: TComboBox;
    cmbCategoria: TComboBox;
    edtValor: TEdit;
    Shape1: TShape;
    btnGravar: TButton;
    DBGrid1: TDBGrid;
    ClientDataSet1: TClientDataSet;
    ClientDataSet1Operacao: TStringField;
    ClientDataSet1Categoria: TStringField;
    ClientDataSet1Valor: TCurrencyField;
    DataSource1: TDataSource;
    procedure btnGravarClick(Sender: TObject);
    procedure cmbOperacaoChange(Sender: TObject);
  private
    { Private declarations }
    FObservers: TList<IObserver>;
    procedure Notificar;
    procedure CarregarCategorias;
  public
    { Public declarations }
    constructor create(AOwner: TComponent); override;
    destructor destroy; override;

    procedure AdicionarObserver(aObserver: IObserver);
    procedure RemoverObserver(aObserver: IObserver);
  end;

implementation

{$R *.dfm}

uses UNotificacao;

{ TfraCadastro }

procedure TfraCadastro.AdicionarObserver(aObserver: IObserver);
begin
  FObservers.Add(aObserver);
end;

procedure TfraCadastro.btnGravarClick(Sender: TObject);
begin
  // Adiciona um registro no DataSet conforme valores informados pelo usuário
  ClientDataSet1.AppendRecord(
    [cmbOperacao.Text, cmbCategoria.Text, StrToFloatDef(edtValor.Text, 0)]);

  // Chama o método de notificação
  Self.Notificar;
end;

procedure TfraCadastro.CarregarCategorias;
begin
  cmbCategoria.Clear;

  case cmbOperacao.ItemIndex of
    0:
    begin
      cmbCategoria.Items.Add('Salário');
      cmbCategoria.Items.Add('13º');
      cmbCategoria.Items.Add('Restitução do IR');
      cmbCategoria.Items.Add('Freelancing');
    end;
    1:
    begin
      cmbCategoria.Items.Add('Aluguel');
      cmbCategoria.Items.Add('Supermercado');
      cmbCategoria.Items.Add('Farmácia');
      cmbCategoria.Items.Add('Escola');
      cmbCategoria.Items.Add('Combustível');
      cmbCategoria.Items.Add('Alimentação');
      cmbCategoria.Items.Add('Roupas');
      cmbCategoria.Items.Add('Viagens');
    end;
  end;
end;

procedure TfraCadastro.cmbOperacaoChange(Sender: TObject);
begin
  Self.CarregarCategorias;
end;

constructor TfraCadastro.create(AOwner: TComponent);
begin
  Inherited;
  FObservers := TList<IObserver>.Create;
end;

destructor TfraCadastro.destroy;
begin
  FObservers.Free;
  inherited;
end;

procedure TfraCadastro.Notificar;
var
  xNotificacao: TNotificacao;
  xObserver: IObserver;
begin
  xNotificacao.Operacao  := ClientDataSet1.FieldByName('Operacao').AsString;
  xNotificacao.Categoria := ClientDataSet1.FieldByName('Categoria').AsString;
  xNotificacao.Valor     := ClientDataSet1.FieldByName('Valor').AsFloat;

  for xObserver in FObservers do
  begin
    xObserver.Atualizar(xNotificacao);
  end;
end;

procedure TfraCadastro.RemoverObserver(aObserver: IObserver);
begin
  FObservers.Delete(FObservers.IndexOf(aObserver));
end;

end.
