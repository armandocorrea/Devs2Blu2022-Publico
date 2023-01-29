unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, UContext, Datasnap.DBClient, UEnumerated;

type
  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Shape1: TShape;
    btnAdicionar: TButton;
    edtDescricao: TEdit;
    edtValor: TEdit;
    edtQuantidade: TEdit;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtDesconto: TEdit;
    edtFrete: TEdit;
    edtTotal: TEdit;
    Label7: TLabel;
    Panel1: TPanel;
    ClientDataSet1: TClientDataSet;
    DataSource1: TDataSource;
    ClientDataSet1Descricao: TStringField;
    ClientDataSet1Quantidade: TFloatField;
    ClientDataSet1Valor: TFloatField;
    ClientDataSet1Total: TFloatField;
    btnRemover: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverClick(Sender: TObject);
  private
    { Private declarations }
    FContext: TContextState;

    procedure AtualizarCategoria;
    procedure AdicionarItem;
    procedure AtualizarCampos;
    procedure RemoverItem;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.AtualizarCampos;
begin
  // Atualiza os campos da tela com os valores obtidos do estado atual
  edtDesconto.Text := FormatFloat('###,##0.00', FContext.ObterValorDesconto);
  edtFrete.Text := FormatFloat('###,##0.00', FContext.ObterValorFrete);
  edtTotal.Text := FormatFloat('###,##0.00',
    FContext.ObterTotalPedido - FContext.ObterValorDesconto + FContext.ObterValorFrete);

  edtDescricao.Text  := EmptyStr;
  edtQuantidade.Text := EmptyStr;
  edtValor.Text      := EmptyStr;
end;

procedure TfrmPrincipal.RemoverItem;
begin
  if ClientDataSet1.IsEmpty then
    Exit;

  FContext.RemoverItem(ClientDataSet1.FieldByName('Total').AsFloat);
  ClientDataSet1.Delete;
end;

procedure TfrmPrincipal.AtualizarCategoria;
begin
  case FContext.ObterCategoriaPedido of
    cpBronze:
    begin
      Panel1.Caption := 'Bronze';
      Panel1.Font.Color := clGreen;
    end;

    cpPrata:
    begin
      Panel1.Caption := 'Prata';
      Panel1.Font.Color := clOlive;
    end;

    cpOuro:
    begin
      Panel1.Caption := 'Ouro';
      Panel1.Font.Color := clBlue;
    end;
  end;
end;

procedure TfrmPrincipal.AdicionarItem;
begin
  ClientDataSet1.Append;
  { preenche os campos... }
  ClientDataSet1Descricao.AsString := edtDescricao.Text;
  ClientDataSet1Quantidade.AsFloat := StrToFloatDef(edtQuantidade.Text, 0);
  ClientDataSet1Valor.AsFloat := StrToFloatDef(edtValor.Text, 0);
  ClientDataSet1Total.AsFloat := ClientDataSet1Quantidade.AsFloat * ClientDataSet1Valor.AsFloat;
  ClientDataSet1.Post;
  // Chama o método "AdicionarItem" do estado atual
  FContext.AdicionarItem(ClientDataSet1.FieldByName('Total').AsFloat);
  // Obtém os valores conforme a categoria do pedido
  edtDesconto.Text := FormatFloat('###,##0.00', FContext.ObterValorDesconto);
  edtFrete.Text := FormatFloat('###,##0.00', FContext.ObterValorFrete);
  edtTotal.Text := FormatFloat('###,##0.00', FContext.ObterTotalPedido - FContext.ObterValorDesconto + FContext.ObterValorFrete);
end;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
begin
  Self.AdicionarItem;
  Self.AtualizarCategoria;
  Self.AtualizarCampos;
end;

procedure TfrmPrincipal.btnRemoverClick(Sender: TObject);
begin
  Self.RemoverItem;
  Self.AtualizarCategoria;
  Self.AtualizarCampos;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FContext.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FContext := TContextState.Create;
end;

end.
