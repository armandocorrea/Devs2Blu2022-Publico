unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, UAluno;

type
  TfrmPrincipal = class(TForm)
    edtNota1: TEdit;
    edtNota2: TEdit;
    edtTrabalho: TEdit;
    btnCalcular: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mmHistorico: TMemo;
    procedure btnCalcularClick(Sender: TObject);
  private
    { Private declarations }

    procedure CalcularMedia;
    procedure ExibirHistorico(aAluno: TAluno);
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

uses
  UDisciplina;

{$R *.dfm}

procedure TfrmPrincipal.btnCalcularClick(Sender: TObject);
begin
  Self.CalcularMedia;
end;

procedure TfrmPrincipal.CalcularMedia;
var
  xAluno: TAluno;
  xDisciplina: TDisciplina;

  xNotas: TProvas;
  xTrabalho: Double;
begin
  xDisciplina := TDisciplina.Create;

  xDisciplina.Id        := 1;
  xDisciplina.Descricao := 'Devs2Blu2022';

  xAluno := TAluno.Create(xDisciplina);

  try
    xAluno.Matricula := 1;
    xAluno.Nome      := 'Armando';

    if not TryStrToFloat(edtNota1.Text, xNotas[1]) then
      raise Exception.Create('Valor inválido para a Nota 1');

    if not TryStrToFloat(edtNota2.Text, xNotas[2]) then
      raise Exception.Create('Valor inválido para a Nota 2');

    if not TryStrToFloat(edtTrabalho.Text, xTrabalho) then
      raise Exception.Create('Valor inválido para o Trabalho');

    xAluno.Notas    := xNotas;
    xAluno.Trabalho := xTrabalho;

    xAluno.CalcularMedia;
    Self.ExibirHistorico(xAluno);
  finally
    FreeAndNil(xAluno);
  end;
end;

procedure TfrmPrincipal.ExibirHistorico(aAluno: TAluno);
begin
  mmHistorico.Clear;
  mmHistorico.Lines.Add('Matrícula..: ' + aAluno.Matricula.ToString);
  mmHistorico.Lines.Add('Disciplina.: ' + aAluno.Disciplina.Descricao);
  mmHistorico.Lines.Add('Aluno......: ' + aAluno.Nome);
  mmHistorico.Lines.Add('Nota 1.....: ' + FormatFloat('0.00', aAluno.Notas[1]));
  mmHistorico.Lines.Add('Nota 2.....: ' + FormatFloat('0.00', aAluno.Notas[2]));
  mmHistorico.Lines.Add('Nota Trab..: ' + FormatFloat('0.00', aAluno.Trabalho));
  mmHistorico.Lines.Add('Média Final: ' + FormatFloat('0.00', aAluno.Media));

  mmHistorico.Lines.Add('');

  if aAluno.NotaFinal = 0 then
    mmHistorico.Lines.Add('Aluno Aprovado!!!')
  else
    mmHistorico.Lines.Add('Aluno de Exame. ' + #13#10 +
                          'Precisará obter ' + FormatFloat('0.0', aAluno.NotaFinal) + ' pontos');
end;

end.
