unit UElevador;

interface

type
  TElevador = class
    private
      FOcupacao: Byte;
      FTotalAndares: Byte;
      FAndarAtual: Byte;
      FCapacidade: Byte;

      procedure SetAndarAtual(const Value: Byte);
      procedure SetCapacidade(const Value: Byte);
      procedure SetOcupacao(const Value: Byte);
      procedure SetTotalAndares(const Value: Byte);

      function GetAndarAtual: Byte;
      function GetCapacidade: Byte;
      function GetOcupacao: Byte;
      function GetTotalAndares: Byte;
    public
      constructor Create(const aCapacidade, aTotalAndares: Byte);

      procedure Entrar(const aPessoas: Byte);
      procedure Sair;
      procedure Subir(const aAndar: Byte);
      procedure Descer(const aAndar: Byte);

      property AndarAtual: Byte   read GetAndarAtual   write SetAndarAtual;
      property TotalAndares: Byte read GetTotalAndares write SetTotalAndares;
      property Capacidade: Byte   read GetCapacidade   write SetCapacidade;
      property Ocupacao: Byte     read GetOcupacao     write SetOcupacao;
  end;

implementation

uses
  System.SysUtils;

{ TElevador }

constructor TElevador.Create(const aCapacidade, aTotalAndares: Byte);
begin
  FCapacidade   := aCapacidade;
  FTotalAndares := aTotalAndares;

  FAndarAtual := 0; //Térro
end;

procedure TElevador.Descer(const aAndar: Byte);
begin
  if (FAndarAtual - aAndar) < 0 then
  begin
    Self.Sair;
    raise Exception.Create('Elevador já encontra-se no Térreo!');
  end;

  FAndarAtual := aAndar;
end;

procedure TElevador.Entrar(const aPessoas: Byte);
begin
  if (FOcupacao + aPessoas) > FCapacidade then
    raise Exception.Create('Capacidade excedida!');

  Inc(FOcupacao, aPessoas);
end;

function TElevador.GetAndarAtual: Byte;
begin
  Result := FAndarAtual;
end;

function TElevador.GetCapacidade: Byte;
begin
  Result := FCapacidade;
end;

function TElevador.GetOcupacao: Byte;
begin
  Result := FOcupacao;
end;

function TElevador.GetTotalAndares: Byte;
begin
  Result := FTotalAndares;
end;

procedure TElevador.Sair;
begin
  if FOcupacao = 0 then
    raise Exception.Create('Não existem pessoas dentro do Elevador!');

  Dec(FOcupacao, FOcupacao);
end;

procedure TElevador.SetAndarAtual(const Value: Byte);
begin
  FAndarAtual := Value;
end;

procedure TElevador.SetCapacidade(const Value: Byte);
begin
  FCapacidade := Value;
end;

procedure TElevador.SetOcupacao(const Value: Byte);
begin
  FOcupacao := Value;
end;

procedure TElevador.SetTotalAndares(const Value: Byte);
begin
  FTotalAndares := Value;
end;

procedure TElevador.Subir(const aAndar: Byte);
begin
  if (FAndarAtual + aAndar) > FTotalAndares then
  begin
    Self.Sair;
    raise Exception.Create('Não existe mais andares superiores!');
  end;

  FAndarAtual := aAndar;
end;

end.
