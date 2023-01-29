unit UCaixa;

interface

uses
  classes;

type
  TOperacoes = (stAbrirCaixa, stSuprimento, stSangria, stSaldoAtual, stFecharCaixa);

  TCaixa = class
    private
      FListaOperacoes: TStringList;

      FSaldoInicial: Double;
      FSaldoAtual: Double;
      FCaixaAberto: Boolean;

      function GetCaixaAberto: Boolean;
      procedure SetCaixaAberto(const aValor: Boolean);

      function GetSaldoInicial: Double;
      procedure SetSaldoInicial(const aValor: Double);

      function GetSaldoAtual: Double;
      procedure SetSaldoAtual(const aValor: Double);
    public
      constructor Create;
      destructor Destroy; override;

      procedure AbrirCaixa(const aValor: Double);
      procedure RetirarValor(const aValor: Double);
      procedure AdicionarValor(const aValor: Double);
      procedure FecharCaixa;
      procedure ExibirOperacoes(aLines: TStrings);

      property SaldoInicial: Double read GetSaldoInicial write SetSaldoInicial;
      property SaldoAtual: Double read GetSaldoAtual write SetSaldoAtual;
      property CaixaAberto: Boolean read GetCaixaAberto write SetCaixaAberto;
  end;

implementation

uses
  SysUtils;

{TCaixa}

constructor TCaixa.Create;
begin
  FListaOperacoes := TStringList.Create;
end;

destructor TCaixa.Destroy;
begin
  FreeAndNil(FListaOperacoes);
end;

procedure TCaixa.AbrirCaixa(const aValor: Double);
begin
  FSaldoInicial := aValor;
  FSaldoAtual   := FSaldoInicial;
  FCaixaAberto  := True;

  FListaOperacoes.Clear;
  FListaOperacoes.Add('Abriu Caixa com R$ ' + FloatToStr(aValor));
end;

procedure TCaixa.RetirarValor(const aValor: Double);
begin
  if (FSaldoAtual - aValor) < 0 then
    raise Exception.Create('Não é possível realizar essa retirada.' + #13#10 +
                           'Seu Saldo Atual é de R$ ' + FloatToStr(FSaldoAtual));

  FSaldoAtual := FSaldoAtual - aValor;
  FListaOperacoes.Add('Retirou R$ ' + FloatToStr(aValor) + ' do Caixa.');
end;

procedure TCaixa.AdicionarValor(const aValor: Double);
begin
  FSaldoAtual := FSaldoAtual + aValor;

  FListaOperacoes.Add('Adicionou R$ ' + FloatToStr(aValor) + ' no Caixa.');
end;

procedure TCaixa.FecharCaixa;
begin
  FCaixaAberto := False;

  FListaOperacoes.Add('Fechou o Caixa com R$ ' + FloatToStr(FSaldoAtual));
end;

procedure TCaixa.ExibirOperacoes(aLines: TStrings);
var
  i: Integer;
begin
  aLines.Clear;
  for i := 0 to pred(FListaOperacoes.Count) do
  begin
    aLines.Add(FListaOperacoes.Strings[i]);
  end;
end;

function TCaixa.GetCaixaAberto: Boolean;
begin
  Result := FCaixaAberto;
end;

procedure TCaixa.SetCaixaAberto(const aValor: Boolean);
begin
  FCaixaAberto := aValor;
end;

function TCaixa.GetSaldoInicial: Double;
begin
  Result := FSaldoInicial;
end;

procedure TCaixa.SetSaldoInicial(const aValor: Double);
begin
  FSaldoInicial := aValor;
end;

function TCaixa.GetSaldoAtual: Double;
begin
  Result := FSaldoAtual;
end;

procedure TCaixa.SetSaldoAtual(const aValor: Double);
begin
  FSaldoAtual := aValor;
end;

end.
