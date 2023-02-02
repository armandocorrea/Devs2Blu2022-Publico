unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnExecutar: TButton;
    memoProgramas: TMemo;
    memoProcessos: TMemo;
    memoVariaveis: TMemo;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnExecutarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses UInvoker, UReceiver, UConcreteCommand;

procedure TfrmPrincipal.btnExecutarClick(Sender: TObject);
var
  xReceiver: TReceiver;
  xInvoker: TInvoker;
begin
  // Cria o Receiver (objeto que contém a codificação das operações)
  xReceiver := TReceiver.Create;

  // Cria o Invoker (objeto que armazena os comandos para executá-los)
  xInvoker := TInvoker.Create;
  try
    // Armazena o comando de extração de programas no Invoker
    xInvoker.Add(TProgramas.Create(xReceiver));

    // Armazena o comando de extração de processos no Invoker
    xInvoker.Add(TProcessos.Create(xReceiver));

    // Armazena o comando de extração das variáveis de ambiente no Invoker
    xInvoker.Add(TVariaveisAmbiente.Create(xReceiver));

    // Solicita ao Invoker que execute todos os comandos armazenados
    xInvoker.ExtrairInformacoes;
  finally
    // Libera os objetos da memória
    FreeAndNil(xInvoker);
    FreeAndNil(xReceiver);
  end;

  MemoProgramas.Lines.LoadFromFile(GetCurrentDir + '\Programas.txt');
  MemoProcessos.Lines.LoadFromFile(GetCurrentDir + '\Processos.txt');
  MemoVariaveis.Lines.LoadFromFile(GetCurrentDir + '\Variaveis.txt');
end;

end.
