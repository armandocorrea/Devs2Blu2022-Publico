unit UConcrete_Visitor_Senioridade;

interface

uses UInterface_Visitor, UConcrete_Element_Gerente,
  UConcrete_Element_Programador;

type
  TSenioridade = class(TInterfacedObject, IVisitor)
    // Método que será invocado quando o objeto do parâmetro for da classe TProgramador
    procedure Visit(aProgramador: TProgramador); overload;

    // Método que será invocado quando o objeto do parâmetro for da classe TGerente
    procedure Visit(aGerente: TGerente); overload;
  end;

implementation

uses
  System.SysUtils, DateUtils;

{ TSenioridade }

procedure TSenioridade.Visit(aGerente: TGerente);
begin
  // Define a senioridade do gerente conforme o tempo de casa
  case YearsBetween(Date, aGerente.Admissao) of
    0..2:
      aGerente.Senioridade := 'Qualificado';
    3..5:
      aGerente.Senioridade := 'Profissional';
    6..8:
      aGerente.Senioridade := 'Experiente';
  end;
end;

procedure TSenioridade.Visit(aProgramador: TProgramador);
begin
  // Define a senioridade do programador conforme o tempo de casa
  case YearsBetween(Date, aProgramador.Admissao) of
    0..1:
      aProgramador.Senioridade := 'Júnior';
    2..3:
      aProgramador.Senioridade := 'Pleno';
    4..5:
      aProgramador.Senioridade := 'Sênior';
    6..8:
      aProgramador.Senioridade := 'Especialista';
  end;
end;

end.
