unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  System.Generics.Collections;

type
  TForm6 = class(TForm)
    Edit1: TEdit;
    btnAdd: TButton;
    btnRemove: TButton;
    btnListar: TButton;
    btnCapacity: TButton;
    btnCount: TButton;
    btnNotify: TButton;
    Memo1: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure btnListarClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure btnCapacityClick(Sender: TObject);
    procedure btnCountClick(Sender: TObject);
    procedure btnNotifyClick(Sender: TObject);
  private
    { Private declarations }
    FListaNum : TList<Integer>;
    procedure Notificacao (Sender: TObject; const aItem: Integer; aAction: TCollectionNotification);
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.btnAddClick(Sender: TObject);
begin
  FListaNum.Add(StrToIntDef(edit1.Text, 0));
end;

procedure TForm6.btnCapacityClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(FListaNum.Capacity.ToString);
  //O Delphi vai aumentando a capacidade por conta própria
end;

procedure TForm6.btnCountClick(Sender: TObject);
begin
  Memo1.Lines.Clear;
  Memo1.Lines.Add(FListaNum.Count.ToString);
end;

procedure TForm6.btnListarClick(Sender: TObject);
var
  I: Integer;
begin
  Memo1.Lines.Clear;
  for I := 0 to Pred(FListaNum.Count) do
  begin
    Memo1.Lines.Add(FListaNum[I].ToString);
  end;
end;

procedure TForm6.btnNotifyClick(Sender: TObject);
begin
  FListaNum.OnNotify := Notificacao;
end;

procedure TForm6.btnRemoveClick(Sender: TObject);
begin
  FListaNum.Delete(Pred(FListaNum.Count));
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  FListaNum := TList<Integer>.Create;
end;

procedure TForm6.Notificacao(Sender: TObject; const aItem: Integer;
  aAction: TCollectionNotification);
begin
  case aAction of
    cnAdded: Memo1.Lines.Add('O item ' + aItem.ToString + ' foi adicionado.');
    cnRemoved: Memo1.Lines.Add('O item ' + aItem.ToString + ' foi removido.');
  end;
end;

end.
