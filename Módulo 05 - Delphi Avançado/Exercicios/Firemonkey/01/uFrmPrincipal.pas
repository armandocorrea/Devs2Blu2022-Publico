unit uFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.Objects, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView, Data.Bind.GenData, System.Rtti, System.Bindings.Outputs,
  Fmx.Bind.Editors, Data.Bind.EngExt, Fmx.Bind.DBEngExt, Data.Bind.Components,
  Data.Bind.ObjectScope;

type
  TfrmPrincipal = class(TForm)
    ToolBar1: TToolBar;
    Rectangle1: TRectangle;
    edtNovaTarefa: TEdit;
    Layout1: TLayout;
    Rectangle2: TRectangle;
    lstTarefas: TListView;
    btnAdicionar: TButton;
    procedure btnAdicionarClick(Sender: TObject);
    procedure lstTarefasDeleteItem(Sender: TObject; AIndex: Integer);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    const DATA = 'DATA';
    procedure AtualizarListaDevice;
    procedure AdicionarItem(const aNovaTarefa: String);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.fmx}

uses
  SharedPreference,
  JSON;

procedure TfrmPrincipal.AdicionarItem(const aNovaTarefa: String);
var
  xItem: TListViewItem;
begin
  xItem      := lstTarefas.Items.Add;
  xItem.Text := aNovaTarefa;

  Self.AtualizarListaDevice;
end;

procedure TfrmPrincipal.AtualizarListaDevice;
var
  xObjeto: TJSONObject;
  I: Integer;
begin
  xObjeto := TJSONObject.Create;
  try
    for I := 0 to Pred(lstTarefas.ItemCount) do
    begin
      xObjeto.AddPair('item', lstTarefas.Items[I].Text);
    end;
    SetPropertiesDispositivo(DATA, xObjeto.ToString);
  finally
    xObjeto.Free;
  end;
end;

procedure TfrmPrincipal.btnAdicionarClick(Sender: TObject);
begin
  Self.AdicionarItem(edtNovaTarefa.Text);
  edtNovaTarefa.Text := '';
end;

procedure TfrmPrincipal.FormShow(Sender: TObject);
var
  xObjeto, xSubObjeto: TJSONObject;
  xJSArray  : TJSONArray;
  xJSValue  : TJSONValue;
  j, i: Integer;
begin
  xObjeto := TJSONObject.ParseJSONValue(GetPropertiesDispositivo(DATA))
    as TJSONObject;

  if Assigned(xObjeto) then
  begin
    lstTarefas.Items.Clear;

    for j := 0 to xObjeto.Size - 1 do
    begin
      xJSValue := xObjeto.Get(j).JsonValue;
      Self.AdicionarItem(xJSValue.Value);
    end;
  end;
end;

procedure TfrmPrincipal.lstTarefasDeleteItem(Sender: TObject; AIndex: Integer);
begin
  Self.AtualizarListaDevice;
end;

end.
