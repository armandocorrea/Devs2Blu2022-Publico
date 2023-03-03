unit UfraMatch.Registry;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts,
  FMX.ListBox,

  UService.Intf;

type
  TfraMatchRegistry = class(TFrame)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    rectSalvar: TRectangle;
    Label1: TLabel;
    rectData: TRectangle;
    edtData: TEdit;
    rectVoltar: TRectangle;
    Label3: TLabel;
    rectHora: TRectangle;
    edtHora: TEdit;
    rectTimeA: TRectangle;
    cmbTimeA: TComboBox;
    rectTimeB: TRectangle;
    cmbTimeB: TComboBox;
    lblX: TLabel;
    procedure rectVoltarClick(Sender: TObject);
    procedure rectSalvarClick(Sender: TObject);
  private
    { Private declarations }
    FServiceTeam: IService;

    procedure VoltarTela;
    procedure CarregarTeams;
    procedure Registrar;
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
  end;

var
  fraMatchRegistry: TfraMatchRegistry;

implementation

{$R *.fmx}

uses
  UfraMatch,
  UService.Team,
  UService.Match,
  UEntity.Teams,
  UEntity.Matchs;

procedure TfraMatchRegistry.CarregarTeams;
var
  xTeam: TTeam;
begin
  cmbTimeA.Items.Clear;
  cmbTimeB.Items.Clear;

  if not Assigned(FServiceTeam) then
    FServiceTeam := TServiceTeam.Create;

  FServiceTeam.Listar;
  for xTeam in TServiceTeam(FServiceTeam).Teams do
  begin
    cmbTimeA.Items.AddObject(xTeam.Name, xTeam);
    cmbTimeB.Items.AddObject(xTeam.Name, xTeam);
  end;
end;

constructor TfraMatchRegistry.Create(aOwner: TComponent);
begin
  Inherited Create(aOwner);
  Self.CarregarTeams;
end;

procedure TfraMatchRegistry.rectSalvarClick(Sender: TObject);
begin
  Self.Registrar;
end;

procedure TfraMatchRegistry.rectVoltarClick(Sender: TObject);
begin
  Self.VoltarTela;
end;

procedure TfraMatchRegistry.VoltarTela;
begin
  if not Assigned(FraMatch) then
    FraMatch := TFraMatch.Create(Application);

  FraMatch.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraMatch);
  FreeAndNil(FraMatchRegistry);
end;

procedure TfraMatchRegistry.Registrar;
var
  xServiceMatch: IService;
  xHora: TTime;
  xData: TDate;
  xTimeAux: TTeam;
  xTimeA, xTimeB: TTeam;
begin
  if Trim(edtHora.Text) = EmptyStr then
    raise Exception.Create('Informe a Hora da Partida.');

  if Trim(edtData.Text) = EmptyStr then
    raise Exception.Create('Informe a Data da Partida.');

  if cmbTimeA.ItemIndex = -1 then
    raise Exception.Create('Informe o Time A da Partida.');

  if cmbTimeB.ItemIndex = -1 then
    raise Exception.Create('Informe o Time B da Partida.');

  if cmbTimeA.ItemIndex = cmbTimeB.ItemIndex then
    raise Exception.Create('Informe Times diferentes para a Partida.');

  xHora  := StrToTime(Trim(edtHora.Text));
  xData  := StrToDate(Trim(edtData.Text));

  xTimeAux := TTeam(cmbTimeA.Items.Objects[cmbTimeA.ItemIndex]);
  xTimeA   := xTimeAux.Clone;

  xTimeAux := TTeam(cmbTimeB.Items.Objects[cmbTimeB.ItemIndex]);
  xTimeB   := xTimeAux.Clone;

  xServiceMatch := TServiceMatch.Create(
    TMatch.Create(xData, xHora, xTimeA, xTimeB));

  xServiceMatch.Registrar;
  Self.VoltarTela;
end;


end.
