unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmPrincipal = class(TForm)
    btnUnica: TButton;
    btnPacote: TButton;
    procedure btnUnicaClick(Sender: TObject);
    procedure btnPacoteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  ULeaf, UComposite;

{$R *.dfm}

procedure TfrmPrincipal.btnPacoteClick(Sender: TObject);
var
  xPacote: TPacoteViagem;
  xViagem1: TViagem;
  xViagem2: TViagem;
begin
  xPacote := TPacoteViagem.Create;
  try
    // primeira viagem do pacote
    xViagem1 := TViagem.Create;
    xViagem1.DefinirOrigem('São Paulo');
    xViagem1.DefinirDestino('Rio de Janeiro');
    xViagem1.DefinirData(StrToDateTime('22/01/2023'));

    // segunda viagem do pacote
    xViagem2 := TViagem.Create;
    xViagem2.DefinirOrigem('Rio de Janeiro');
    xViagem2.DefinirDestino('Curitiba');
    xViagem2.DefinirData(StrToDateTime('25/01/2023'));

    xPacote.AdicionarViagem(xViagem1);
    xPacote.AdicionarViagem(xViagem2);

    // O método irá ler cada uma das viagens dentro do pacote,
    // ou seja, cada Leaf dentro do Composite,
    // para calcular o valor de cada viagem, e por fim, obter o valor total do pacote
    ShowMessage('Total: ' + FloatToStr(xPacote.CalcularValor));
  finally
    FreeAndNil(xPacote);
  end;
end;

procedure TfrmPrincipal.btnUnicaClick(Sender: TObject);
var
  xViagem: TViagem;
begin
  xViagem := TViagem.Create;
  try
    xViagem.DefinirOrigem('São Paulo');
    xViagem.DefinirDestino('Rio de Janeiro');
    xViagem.DefinirData(StrToDateTime('22/01/2022'));
    //Chama o Operation
    ShowMessage('Total: ' + FloatToStr(xViagem.CalcularValor));
  finally
    FreeAndNil(xViagem);
  end;
end;

end.
