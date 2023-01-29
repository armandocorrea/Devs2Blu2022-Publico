unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

  Generics.Collections, UReuniao, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnClonar: TButton;
    ListBox1: TListBox;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClonarClick(Sender: TObject);
  private
    { Private declarations }
    FListaReunioes: TObjectList<TReuniao>;

    procedure CarregarAgenda;
    procedure Notify(Sender: TObject; const aItem: TReuniao; aAction: TCollectionNotification);
    procedure AdicionarLista(xNovaReuniao: TReuniao);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}


procedure TfrmPrincipal.btnClonarClick(Sender: TObject);
var
  xReuniaoSelecionada: TReuniao;
  xReuniaoClone: TReuniao;
  xIndice: Integer;
begin
  xIndice := ListBox1.ItemIndex;

  //Seleciona a reunião na lista de objetos conforme o indice
  //e atribui à variavel
  xReuniaoSelecionada := FListaReunioes[xIndice] as TReuniao;

  // Comando para clonar a reunião
  xReuniaoClone := xReuniaoSelecionada.Clonar;

  // Adiciona o clone na lista
  FListaReunioes.Add(xReuniaoClone);
end;

procedure TfrmPrincipal.CarregarAgenda;
var
  xNovaReuniao: TReuniao;
begin
  xNovaReuniao := TReuniao.Create;
  xNovaReuniao.Nome := 'Daily';
  xNovaReuniao.Data := Date;
  xNovaReuniao.Hora := now;
  xNovaReuniao.Categoria := clRed;
  xNovaReuniao.Participantes := 'Armando|Neto';
  FListaReunioes.Add(xNovaReuniao);

  xNovaReuniao := TReuniao.Create;
  xNovaReuniao.Nome := 'Café da Tarde';
  xNovaReuniao.Data := Date;
  xNovaReuniao.Hora := now;
  xNovaReuniao.Categoria := clBlack;
  xNovaReuniao.Participantes := 'Maria|José';
  FListaReunioes.Add(xNovaReuniao);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FListaReunioes.Clear;
  FListaReunioes.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FListaReunioes := TObjectList<TReuniao>.Create;
  FListaReunioes.OnNotify := Self.Notify;
  Self.CarregarAgenda;
end;


procedure TfrmPrincipal.Notify(Sender: TObject; const aItem: TReuniao; aAction: TCollectionNotification);
begin
  case aAction of
    cnAdded:
      Self.AdicionarLista(aItem);
  end;
end;

procedure TfrmPrincipal.AdicionarLista(xNovaReuniao: TReuniao);
begin
  ListBox1.Items.Add('Reunião: ' + xNovaReuniao.Nome + ' - Data: ' + DateToStr(xNovaReuniao.Data) + ' - Part: ' + xNovaReuniao.Participantes);
end;

end.
