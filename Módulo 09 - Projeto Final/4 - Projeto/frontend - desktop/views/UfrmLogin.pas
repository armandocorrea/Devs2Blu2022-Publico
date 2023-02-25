unit UfrmLogin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls;

type
  TfrmLogin = class(TForm)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    rectLogin: TRectangle;
    Label1: TLabel;
    rectRegistrar: TRectangle;
    Label2: TLabel;
    rectSair: TRectangle;
    Label3: TLabel;
    procedure rectSairClick(Sender: TObject);
    procedure rectLoginClick(Sender: TObject);
    procedure rectRegistrarClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirLoginAuthentication;
    procedure AbrirLoginRegistry;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.fmx}

uses
  UfrmLogin.Authentication,
  UfrmLogin.Registry;

procedure TfrmLogin.AbrirLoginAuthentication;
begin
  if not Assigned(frmLoginAuthentication) then
    frmLoginAuthentication := TfrmLoginAuthentication.Create(Application);

  frmLoginAuthentication.Show;
  Application.MainForm := frmLoginAuthentication;
  Self.Close;
end;

procedure TfrmLogin.AbrirLoginRegistry;
begin
  if not Assigned(frmLoginRegistry) then
    frmLoginRegistry := TfrmLoginRegistry.Create(Application);

  frmLoginRegistry.Show;
  Application.MainForm := frmLoginRegistry;
  Self.Close;
end;

procedure TfrmLogin.rectLoginClick(Sender: TObject);
begin
  Self.AbrirLoginAuthentication;
end;

procedure TfrmLogin.rectRegistrarClick(Sender: TObject);
begin
  Self.AbrirLoginRegistry;
end;

procedure TfrmLogin.rectSairClick(Sender: TObject);
begin
  Self.Close;
end;

end.
