unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  UCaretaker, UOriginator;

type
  TfrmPrincipal = class(TForm)
    ListBox1: TListBox;
    Label1: TLabel;
    Label2: TLabel;
    edtTitulo: TEdit;
    GroupBox1: TGroupBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    ColorBox1: TColorBox;
    RichEdit1: TRichEdit;
    btnSalvar: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSalvarClick(Sender: TObject);
    procedure ListBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ColorBox1Change(Sender: TObject);
  private
    { Private declarations }
    FCaretaker: TCaretaker;
    FOriginator: TOriginator;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnSalvarClick(Sender: TObject);
var
  xDataHoraAtual: String;
  xTexto: TStringStream;
begin
  // Preenche a informação de título do Originator
  FOriginator.Titulo := edtTitulo.Text;

  // Cria uma instância da classe TStringStream
  xTexto := TStringStream.Create;
  try
    // Salva o texto formatado do TRichEdit na stream
    RichEdit1.Lines.SaveToStream(xTexto);

    // Converte a stream em string, preenchendo a informação de texto do Originator
    FOriginator.Texto := xTexto.DataString;
  finally
    // Libera a instância de TStringStream
    xTexto.Free;
  end;

  // Formata a data e hora atual, transformando-as em uma string
  xDataHoraAtual := FormatDateTime('dd/mm/yyyy hh:nn:ss:zzz', Now);

  // Adiciona o novo estado (Memento) no dicionário
  FCaretaker.Adicionar(xDataHoraAtual, FOriginator.SalvarEstado);

  // Adiciona a alteração no histórico
  ListBox1.Items.Add(xDataHoraAtual);
end;

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  RichEdit1.Font.Style := RichEdit1.Font.Style + [fsBold];
end;

procedure TfrmPrincipal.Button2Click(Sender: TObject);
begin
  RichEdit1.Font.Style := RichEdit1.Font.Style + [fsItalic];
end;

procedure TfrmPrincipal.Button3Click(Sender: TObject);
begin
  RichEdit1.Font.Style := RichEdit1.Font.Style + [fsUnderline];
end;

procedure TfrmPrincipal.ColorBox1Change(Sender: TObject);
begin
  RichEdit1.Font.Color := ColorBox1.Selected;
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FOriginator.Free;
  FCaretaker.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FCaretaker  := TCaretaker.Create;
  FOriginator := TOriginator.Create;
end;

procedure TfrmPrincipal.ListBox1Click(Sender: TObject);
var
  xDataHora: string;
  xTexto: TStringStream;
begin
  xDataHora := ListBox1.Items[ListBox1.ItemIndex];

  // Obtém o estado conforme o item selecionado no histórico de alterações,
  // e restaura o título e o texto (substituindo os dados do Originator pelos dados do Memento encontrado)
  FOriginator.RestaurarEstado(FCaretaker.Obter(xDataHora));

  // Preenche o campo referente ao título com os dados do Originator
  edtTitulo.Text := FOriginator.Titulo;

  // Cria uma instância da classe TStringStream informando o texto como parâmetro
  xTexto := TStringStream.Create(FOriginator.Texto);
  try
    // Preenche o campo referente ao texto, carregando-o da stream
    RichEdit1.Lines.LoadFromStream(xTexto);
  finally
    // Libera a instância de TStringStream
    xTexto.Free;
  end;

end;

end.
