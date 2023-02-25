unit UfrmHome;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts, FMX.Controls.Presentation, FMX.StdCtrls, FMX.MultiView,
  FMX.ListBox;

type
  TfrmHome = class(TForm)
    rectPrincipal: TRectangle;
    MultiView1: TMultiView;
    Rectangle1: TRectangle;
    imgLogo: TImage;
    lytLogo: TLayout;
    lstMenu: TListBox;
    btnMenu: TSpeedButton;
    lytContainer: TLayout;
    imgDevsHome: TImage;
    StyleBook1: TStyleBook;

    procedure lstMenuItemClick(const Sender: TCustomListBox; const Item: TListBoxItem);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure AbrirTeam;
    procedure AbrirMatch;
    procedure AbrirBet;

    procedure RemoverTelaAnterior;
  public
    { Public declarations }
  end;

var
  frmHome: TfrmHome;

implementation

{$R *.fmx}

uses
  {UfraTeam,
  UfraMatch,
  UfraBet,}
  UUtils.Enums;

procedure TfrmHome.AbrirTeam;
begin
  {if not Assigned(FraTeam) then
    FraTeam := TFraTeam.Create(Application);

  FraTeam.Align := TAlignLayout.Center;
  lytContainer.AddObject(FraTeam);}
end;

procedure TfrmHome.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action  := TCloseAction.caFree;
  frmHome := nil;
end;

procedure TfrmHome.AbrirMatch;
begin
  {if not Assigned(FraMatch) then
    FraMatch := TFraMatch.Create(Application);

  FraMatch.Align := TAlignLayout.Center;
  lytContainer.AddObject(FraMatch);}
end;

procedure TfrmHome.AbrirBet;
begin
  {if not Assigned(FraBet) then
    FraBet := TFraBet.Create(Application);

  FraBet.Align := TAlignLayout.Center;
  lytContainer.AddObject(FraBet);}
end;

procedure TfrmHome.lstMenuItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  Self.RemoverTelaAnterior;

  case TEnumMenu(Item.Index) of
    mnuTime:
      Self.AbrirTeam;
    mnuPartidas:
      Self.AbrirMatch;
    mnuPalpites:
      Self.AbrirBet;
    mnuSair:
      Self.Close;
  end;

  MultiView1.HideMaster;
end;

procedure TfrmHome.RemoverTelaAnterior;
var
  I: Integer;
begin
  for I := Pred(lytContainer.ControlsCount) downto 0 do
    if lytContainer.Controls[I].Name <> 'imgDevsHome' then
      lytContainer.RemoveObject(I);
end;

end.
