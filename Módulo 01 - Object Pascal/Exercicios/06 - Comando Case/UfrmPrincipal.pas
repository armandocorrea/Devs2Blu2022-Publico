unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TAnimal = (tpCachorro, tpPassaro, tpGato, tpPeixe);

  TfrmPrincipal = class(TForm)
    Label1: TLabel;
    cmbAnimal: TComboBox;
    Button1: TButton;
    mmHistorico: TMemo;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure QueAnimalSouEu;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.Button1Click(Sender: TObject);
begin
  case cmbAnimal.ItemIndex of
    0: //Cachorro
    begin
      mmHistorico.Lines.Add('Sou um cachorro e tenho 4 patas.');
    end;
    1: //Pássaro
    begin
      mmHistorico.Lines.Add('Sou um pássaro e tenho 2 patas.');
    end;
    2: //Gato
    begin
      mmHistorico.Lines.Add('Sou um gato e tenho 4 patas.');
    end;
    3: //Peixe
    begin
      mmHistorico.Lines.Add('Sou um peixe e possuo nadadeiras.');
    end;
    else //Sem Definição
    begin
      mmHistorico.Lines.Add('Não foi definido nenhum animal.');
    end;
  end;
end;

procedure TfrmPrincipal.QueAnimalSouEu;
var
  xFrase: String;
begin
  case TAnimal(cmbAnimal.ItemIndex) of
    tpCachorro: //Cachorro
    begin
      xFrase := 'Sou um cachorro e tenho 4 patas.';
    end;
    tpPassaro: //Pássaro
    begin
      xFrase := 'Sou um pássaro e tenho 2 patas.';
    end;
    tpGato: //Gato
    begin
      xFrase := 'Sou um gato e tenho 4 patas.';
    end;
    tpPeixe: //Peixe
    begin
      xFrase := 'Sou um peixe e possuo nadadeiras.';
    end;
    else //Sem Definição
    begin
      xFrase := 'Não foi definido nenhum animal.';
    end;
  end;

  mmHistorico.Lines.Add(xFrase);
end;

end.
