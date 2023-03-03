unit UfraTeam.Registry;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants, 
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts;

type
  TfraTeamRegistry = class(TFrame)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    rectSalvar: TRectangle;
    Label1: TLabel;
    rectNome: TRectangle;
    edtNome: TEdit;
    rectVoltar: TRectangle;
    Label3: TLabel;
    procedure rectVoltarClick(Sender: TObject);
    procedure rectSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure VoltarTela;
    procedure Registrar;
  public
    { Public declarations }
  end;

var
  fraTeamRegistry: TfraTeamRegistry;

implementation

{$R *.fmx}

uses
  UfraTeam,
  UEntity.Teams,
  UService.Intf,
  UService.Team;

{ TfraTimeRegistro }

procedure TfraTeamRegistry.rectSalvarClick(Sender: TObject);
begin
  Self.Registrar;
end;

procedure TfraTeamRegistry.rectVoltarClick(Sender: TObject);
begin
  Self.VoltarTela;
end;

procedure TfraTeamRegistry.Registrar;
var
  xServiceTeam: IService;
begin
  if Trim(edtNome.Text) = EmptyStr then
    raise Exception.Create('Informe o Nome do Time.');

  xServiceTeam := TServiceTeam.Create(
    TTeam.Create(Trim(edtNome.Text)));

  xServiceTeam.Registrar;
  Self.VoltarTela;
end;

procedure TfraTeamRegistry.VoltarTela;
begin
  if not Assigned(FraTeam) then
    FraTeam := TFraTeam.Create(Application);

  FraTeam.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraTeam);
  FreeAndNil(FraTeamRegistry);
end;

end.
