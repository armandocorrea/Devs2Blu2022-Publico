unit UfraBet.Registry;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.Layouts, UService.Intf,
  FMX.ListBox, FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  FMX.ListView,

  UEntity.Matchs;

type
  TfraBetRegistry = class(TFrame)
    rectPrincipal: TRectangle;
    lytPrincipal: TLayout;
    imgLogo: TImage;
    lytBotoes: TLayout;
    rectSalvar: TRectangle;
    Label1: TLabel;
    rectVoltar: TRectangle;
    Label3: TLabel;
    rectTimeA: TRectangle;
    rectTimeB: TRectangle;
    lblX: TLabel;
    lstPartidas: TListView;
    edtResultTeamA: TEdit;
    edtResultTeamB: TEdit;
    procedure rectVoltarClick(Sender: TObject);
    procedure rectSalvarClick(Sender: TObject);
  private
    { Private declarations }
    procedure VoltarTela;
    procedure CarregarMatchs;
    procedure Registrar;
    procedure PreencheMatchs(const aMatch: TMatch);
  public
    { Public declarations }
    constructor Create(aOwner: TComponent); override;
  end;

var
  fraBetRegistry: TfraBetRegistry;

implementation

{$R *.fmx}

uses
  UfraBet,
  UService.Team,
  UService.Match,
  UEntity.Bets,
  UService.Bet,
  UService.User.Authenticated;

procedure TfraBetRegistry.CarregarMatchs;
var
  xServiceMatch: IService;
  xMatch: TMatch;
begin
  lstPartidas.Items.Clear;

  xServiceMatch := TServiceMatch.Create;
  xServiceMatch.Listar;
  for xMatch in TServiceMatch(xServiceMatch).Matchs do
    Self.PreencheMatchs(xMatch);
end;

procedure TfraBetRegistry.PreencheMatchs(const aMatch: TMatch);
var
  xItem: TListViewItem;
const
  PARTIDA = '%s X %s - %s às %s';
begin
  xItem     := lstPartidas.Items.Add;
  xItem.Tag := aMatch.Id;

  TListItemText(xItem.Objects.FindDrawable('txtPartida')).Text :=
    Format(PARTIDA, [aMatch.TeamA.Name,
                     aMatch.TeamB.Name,
                     DateToStr(aMatch.Date),
                     TimeToStr(aMatch.Hour)]);
end;

constructor TfraBetRegistry.Create(aOwner: TComponent);
begin
  Inherited Create(aOwner);
  Self.CarregarMatchs;
end;

procedure TfraBetRegistry.rectSalvarClick(Sender: TObject);
begin
  Self.Registrar;
end;

procedure TfraBetRegistry.rectVoltarClick(Sender: TObject);
begin
  Self.VoltarTela;
end;

procedure TfraBetRegistry.VoltarTela;
begin
  if not Assigned(FraBet) then
    FraBet := TFraBet.Create(Application);

  FraBet.Align := TAlignLayout.Center;

  Self.Parent.AddObject(FraBet);
  FreeAndNil(FraBetRegistry);
end;

procedure TfraBetRegistry.Registrar;
var
  xServiceBet: IService;
  xBet: TBet;
  xMatch: TMatch;
  xUserAuthenticated: TUserAuthenticated;
begin
  if lstPartidas.ItemIndex < 0 then
    raise Exception.Create('Selecione uma Partida.');

  if Trim(edtResultTeamA.Text) = EmptyStr then
    raise Exception.Create('Informe o Placar do Time A.');

  if Trim(edtResultTeamB.Text) = EmptyStr then
    raise Exception.Create('Informe o Placar do Time B.');

  xMatch := TMatch.Create(lstPartidas.Items[lstPartidas.ItemIndex].Tag);
  xUserAuthenticated := TUserAuthenticated.GetInstance;

  xBet := TBet.Create(
    xMatch,
    StrToIntDef(Trim(edtResultTeamA.Text), 0),
    StrToIntDef(Trim(edtResultTeamB.Text), 0),
    xUserAuthenticated.User);

  xServiceBet := TServiceBet.Create(xBet);
  xServiceBet.Registrar;
  Self.VoltarTela;
end;


end.
