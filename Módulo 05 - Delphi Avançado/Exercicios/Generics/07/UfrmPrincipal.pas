unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Generics.Collections;

type
  TfrmPrincipal = class(TForm)
    Edit1: TEdit;
    Memo1: TMemo;
    btnEnqueue: TButton;
    btnDequeue: TButton;
    btnExtract: TButton;
    btnPeek: TButton;
    btnTrimExcess: TButton;
    btnCount: TButton;
    btnCapacity: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEnqueueClick(Sender: TObject);
    procedure btnDequeueClick(Sender: TObject);
    procedure btnPeekClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnCountClick(Sender: TObject);
    procedure btnCapacityClick(Sender: TObject);
    procedure btnTrimExcessClick(Sender: TObject);
  private
    { Private declarations }
    FFila: TQueue<String>;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCapacityClick(Sender: TObject);
begin
  Memo1.Lines.Add(FFila.Capacity.ToString);
end;

procedure TfrmPrincipal.btnCountClick(Sender: TObject);
begin
  Memo1.Lines.Add(FFila.Count.ToString);
end;

procedure TfrmPrincipal.btnDequeueClick(Sender: TObject);
begin
  Memo1.Lines.Add(FFila.Dequeue);
end;

procedure TfrmPrincipal.btnEnqueueClick(Sender: TObject);
begin
  FFila.Enqueue(Edit1.Text);
end;

procedure TfrmPrincipal.btnExtractClick(Sender: TObject);
begin
  //Mesmo comportamento do Dequeue a diferença que vc pode capturar a ação no notify
  Memo1.Lines.Add(FFila.Extract);
end;

procedure TfrmPrincipal.btnPeekClick(Sender: TObject);
begin
  Memo1.Lines.Add(FFila.Peek);
end;

procedure TfrmPrincipal.btnTrimExcessClick(Sender: TObject);
begin
  FFila.TrimExcess;
  Memo1.Lines.Add(FFila.Capacity.ToString);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FFila.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FFila := TQueue<String>.Create;
end;

end.
