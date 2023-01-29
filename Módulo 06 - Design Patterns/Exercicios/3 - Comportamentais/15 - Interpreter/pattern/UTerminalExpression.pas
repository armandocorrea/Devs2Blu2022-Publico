unit UTerminalExpression;

interface

uses UContext, UAbstractExpression;

type
  { TerminalExpression }
  TComandoExpression = class(TAbstractExpression)
  public
    procedure Interpretar(aContexto: TContext); override;
  end;

  { TerminalExpression }
  TColunasExpression = class(TAbstractExpression)
  public
    procedure Interpretar(aContexto: TContext); override;
  end;

  { TerminalExpression }
  TTabelaExpression = class(TAbstractExpression)
  public
    procedure Interpretar(aContexto: TContext); override;
  end;

  { TerminalExpression }
  TCondicaoExpression = class(TAbstractExpression)
  public
    procedure Interpretar(aContexto: TContext); override;
  end;

implementation

uses
  System.SysUtils, System.Classes, StrUtils;

{ TComandoExpression }

procedure TComandoExpression.Interpretar(aContexto: TContext);
begin
  // Se existir a palavra "selecionar", traduz para "Select"
  if Pos('selecionar', LowerCase(aContexto.Entrada)) > 0 then
    aContexto.Saida := 'Select'

  // Se existir a palavra "atualizar", traduz para "Update"
  else if Pos('atualizar', LowerCase(aContexto.Entrada)) > 0 then
    aContexto.Saida := 'Update'

  // Se existir a palavra "excluir", traduz para "Delete"
  else if Pos('excluir', LowerCase(aContexto.Entrada)) > 0 then
    aContexto.Saida := 'Delete';
end;

{ TColunasExpression }

procedure TColunasExpression.Interpretar(aContexto: TContext);
var
  xPosicaoQuebra: integer;
  xPosicaoEspaco: integer;
begin
  // Extrai as strings da entrada do contexto
  ExtractStrings([' '], [], PWideChar(aContexto.Entrada), FPartes);

  if Pos('Select', aContexto.Saida) > 0 then
  begin
    xPosicaoQuebra := Pos('dos', LowerCase(aContexto.Entrada))
                   + Pos('das', LowerCase(aContexto.Entrada));

    // Se não existirem as palavras "dos" ou "das",
    // então seleciona-se todas as colunas (*)
    if xPosicaoQuebra = 0 then
    begin
      aContexto.Saida := Format('%s *', [aContexto.Saida, FPartes[1]]);
      Exit;
    end;

    // Caso contrário, obtém as colunas informadas
    xPosicaoEspaco := Pos(' ', aContexto.Entrada);
    aContexto.Saida := Format('%s %s', [aContexto.Saida,
      Copy(aContexto.Entrada, xPosicaoEspaco, xPosicaoQuebra - xPosicaoEspaco)]);
  end;

end;

{ TTabelaExpression }

procedure TTabelaExpression.Interpretar(aContexto: TContext);
var
  xPosicaoQuebra: Integer;
  PosicaoEspaco: Integer;
begin
  // Extrai as strings da entrada do contexto
  ExtractStrings([' '], [], PWideChar(aContexto.Entrada), FPartes);

  if Pos('Select', aContexto.Saida) > 0 then
  begin
    xPosicaoQuebra := Pos('dos', LowerCase(aContexto.Entrada))
                   + Pos('das', LowerCase(aContexto.Entrada));

    // Se não existirem as palavras "dos" ou "das",
    // a segunda parte do texto é o nome da tabela
    if xPosicaoQuebra = 0 then
    begin
      aContexto.Saida := Format('%s from %s', [aContexto.Saida, FPartes[1]]);
      Exit;
    end;

    // Caso contrário, é necessário calcular o nome da tabela
    // após as palavras "dos" ou "das"
    Inc(xPosicaoQuebra, 4);
    PosicaoEspaco := PosEx(' ', aContexto.Entrada, xPosicaoQuebra);

    if PosicaoEspaco = 0 then
      PosicaoEspaco := Length(aContexto.Entrada);

    aContexto.Saida := Concat(aContexto.Saida,
      Format(' from %s',
      [Copy(aContexto.Entrada, xPosicaoQuebra, Abs(xPosicaoQuebra - PosicaoEspaco))]));

    Exit;
  end;

  // Se o comando for Update, a quarta parte do texto é o nome da tabela
  if Pos('Update', aContexto.Saida) > 0 then
  begin
    aContexto.Saida := Format('%s %s', [aContexto.Saida, FPartes[3] + 's']);
    Exit;
  end;

  // Se o comando for Delete, a segunda parte do texto é o nome da tabela
  if Pos('Delete', aContexto.Saida) > 0 then
  begin
    aContexto.Saida := Format('%s from %s', [aContexto.Saida, FPartes[1] + 's']);
  end;
end;

{ TCondicaoExpression }

procedure TCondicaoExpression.Interpretar(aContexto: TContext);
var
  xPosicao: integer;
  xValor: string;
begin
  // Extrai as strings da entrada do contexto
  ExtractStrings([' '], [], PWideChar(aContexto.Entrada), FPartes);

  // Se existir a palavra "de", significa que a busca é por cidade
  xPosicao := Pos(' de ', LowerCase(aContexto.Entrada));
  if xPosicao > 0 then
  begin
    xValor := Copy(aContexto.Entrada, xPosicao + 4, Length(aContexto.Entrada));
    aContexto.Saida := Concat(aContexto.Saida,  Format(' where cidade = "%s"', [xValor]));
    Exit;
  end;

  // Se existir a frase "com nome", significa que a busca é por nome
  xPosicao := Pos('com nome', LowerCase(aContexto.Entrada));
  if xPosicao > 0 then
  begin
    xValor := Copy(aContexto.Entrada, xPosicao + 9, Length(aContexto.Entrada));
    aContexto.Saida := Concat(aContexto.Saida,  Format(' where nome = "%s"', [xValor]));
    Exit;
  end;

  // Se existir a palavra "para", significa que é uma atualização (Update)
  xPosicao := Pos('para', LowerCase(aContexto.Entrada));
  if xPosicao > 0 then
  begin
    xValor := Copy(aContexto.Entrada, xPosicao + 5, Length(aContexto.Entrada));
    aContexto.Saida := Concat(aContexto.Saida,
      Format(' set %s = "%s" where ID = %s', [FPartes[1], xValor, FPartes[4]]));
    Exit;
  end;

  // Se for um comando Delete,
  // apenas identifica se o critério de exclusão é o ID ou Nome
  if Pos('Delete', aContexto.Saida) > 0 then
  begin
    if StrToIntDef(FPartes[2], 0) > 0 then
      aContexto.Saida := Format('%s where ID = %s', [aContexto.Saida, FPartes[2]])
    else
      aContexto.Saida := Format('%s where nome = "%s"', [aContexto.Saida, FPartes[2]]);
  end;
end;

end.
