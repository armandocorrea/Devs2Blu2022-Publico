unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Relatrios1: TMenuItem;
    Exerccio011: TMenuItem;
    Exerccio021: TMenuItem;
    Exerccio031: TMenuItem;
    procedure Exerccio011Click(Sender: TObject);
    procedure Exerccio021Click(Sender: TObject);
    procedure Exerccio031Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses URelActores, URelCity, URelActoresFilmes;

procedure TfrmPrincipal.Exerccio011Click(Sender: TObject);
begin
  if not Assigned(frmRelAtores) then
    frmRelAtores := TfrmRelAtores.Create(Self);

  frmRelAtores.Show;
end;

procedure TfrmPrincipal.Exerccio021Click(Sender: TObject);
begin
  if not Assigned(frmRelCity) then
    frmRelCity := TfrmRelCity.Create(Self);

  frmRelCity.Show;
end;

procedure TfrmPrincipal.Exerccio031Click(Sender: TObject);
begin
  if not Assigned(frmRelAtoresFilmes) then
    frmRelAtoresFilmes := TfrmRelAtoresFilmes.Create(Self);

  frmRelAtoresFilmes.Show;
end;

end.
