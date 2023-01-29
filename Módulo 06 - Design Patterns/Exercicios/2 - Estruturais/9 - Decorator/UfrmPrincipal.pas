unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.AppEvnts, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    ApplicationEvents1: TApplicationEvents;
    btnExcecao: TButton;
    procedure ApplicationEvents1Exception(Sender: TObject; E: Exception);
    procedure btnExcecaoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UInterfaceComponent,
  UConcreteComponent, UConcreteDecorator_DataHora, UConcreteDecorator_Usuario,
  UConcreteDecorator_Windows;

{$R *.dfm}

procedure TfrmPrincipal.ApplicationEvents1Exception(Sender: TObject;
  E: Exception);
var
  xLogExcecao: ILogExcecao;
begin
  xLogExcecao := TLogExcecao.Create(E);

  xLogExcecao := TDataHoraDecorator.Create(xLogExcecao);
  xLogExcecao := TUsuarioDecorator.Create(xLogExcecao);
  xLogExcecao := TWindowsDecorator.Create(xLogExcecao);

  ShowMessage(xLogExcecao.ObterDadosExcecao);
end;

procedure TfrmPrincipal.btnExcecaoClick(Sender: TObject);
begin
  raise Exception.Create('Qualquer Exceção!');
end;

end.
