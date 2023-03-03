unit UfraTeam;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, FMX.ListBox,
  FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,

  UEntity.Teams;

type
  TfraTeam = class(TFrame)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    rectToolbar: TRectangle;
    rectNovo: TRectangle;
    Label2: TLabel;
    rectExcluir: TRectangle;
    Label1: TLabel;
    lstTimes: TListView;
    procedure rectNovoClick(Sender: TObject);
    procedure rectExcluirClick(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirTeamRegistry;
    procedure CarregarRegistros;
    procedure ExcluirRegistro;
    procedure PreencherTeams(aTeam: TTeam);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
  end;

var
  fraTeam: TfraTeam;

implementation

{$R *.fmx}

uses
  UfraTeam.Registry,
  UService.Intf,
  UService.Team;

procedure TfraTeam.AbrirTeamRegistry;
begin
  if not Assigned(FraTeamRegistry) then
    FraTeamRegistry := TFraTeamRegistry.Create(Application);

  FraTeamRegistry.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraTeamRegistry);
  FreeAndNil(FraTeam);
end;

procedure TfraTeam.CarregarRegistros;
var
  xServiceTeam: IService;
  xTeam: TTeam;
begin
  lstTimes.Items.Clear;

  xServiceTeam := TServiceTeam.Create;
  xServiceTeam.Listar;

  for xTeam in TServiceTeam(xServiceTeam).Teams do
    Self.PreencherTeams(xTeam);
end;

procedure TfraTeam.PreencherTeams(aTeam: TTeam);
var
  xItem: TListViewItem;
begin
  xItem     := lstTimes.Items.Add;
  xItem.Tag := aTeam.Id;

  TListItemText(xItem.Objects.FindDrawable('txtTime')).Text := aTeam.Name;
end;

constructor TfraTeam.Create(aOwner: TComponent);
begin
  Inherited Create(aOwner);
  Self.CarregarRegistros;
end;

procedure TfraTeam.ExcluirRegistro;
var
  xServiceTeam: IService;
  xTeam: TTeam;
  xItem: TListViewItem;
begin
  if lstTimes.ItemIndex = -1 then
    Exit;

  xItem := lstTimes.Items[lstTimes.ItemIndex];
  xTeam := TTeam.Create(xItem.Tag);

  xServiceTeam := TServiceTeam.Create(xTeam);
  try
    xServiceTeam.Excluir;
    ShowMessage('Registro excluido.');
  finally
    Self.CarregarRegistros;
  end;
end;

procedure TfraTeam.rectExcluirClick(Sender: TObject);
begin
  Self.ExcluirRegistro;
end;

procedure TfraTeam.rectNovoClick(Sender: TObject);
begin
  Self.AbrirTeamRegistry;
end;

end.
