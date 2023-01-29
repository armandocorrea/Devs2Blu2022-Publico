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
    btnPush: TButton;
    btnPop: TButton;
    btnExtract: TButton;
    btnPeek: TButton;
    btnTrimExcess: TButton;
    btnCount: TButton;
    btnCapacity: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnPushClick(Sender: TObject);
    procedure btnPopClick(Sender: TObject);
    procedure btnExtractClick(Sender: TObject);
    procedure btnPeekClick(Sender: TObject);
    procedure btnTrimExcessClick(Sender: TObject);
    procedure btnCapacityClick(Sender: TObject);
    procedure btnCountClick(Sender: TObject);
  private
    { Private declarations }
    FPilha: TStack<String>;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.btnCapacityClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Capacity.ToString);
end;

procedure TfrmPrincipal.btnCountClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Count.ToString);
end;

procedure TfrmPrincipal.btnExtractClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Extract);
end;

procedure TfrmPrincipal.btnPeekClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Peek);
end;

procedure TfrmPrincipal.btnPopClick(Sender: TObject);
begin
  Memo1.Lines.Add(FPilha.Pop);
end;

procedure TfrmPrincipal.btnPushClick(Sender: TObject);
begin
  FPilha.Push(Edit1.Text);
end;

procedure TfrmPrincipal.btnTrimExcessClick(Sender: TObject);
begin
  FPilha.TrimExcess;
  Memo1.Lines.Add(FPilha.Capacity.ToString);
end;

procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  FPilha.Free;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  FPilha := TStack<String>.Create;
end;

end.
