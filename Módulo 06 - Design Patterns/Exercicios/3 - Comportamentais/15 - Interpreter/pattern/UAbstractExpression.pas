unit UAbstractExpression;

interface

uses
  UContext, System.Classes;

type
  TAbstractExpression = class
  protected
    // Variável que armanezará as partes da entrada
    FPartes: TStringList;
  public
    constructor Create;
    destructor Destroy; override;

    // Método que será sobrescrito por todas as classes herdadas
    procedure Interpretar(aContexto: TContext); virtual; abstract;
  end;

implementation

uses
  System.SysUtils;



{ TAbstractExpression }

constructor TAbstractExpression.Create;
begin
  FPartes := TStringList.Create;
end;

destructor TAbstractExpression.Destroy;
begin
  FreeAndNil(FPartes);
  inherited;
end;

end.
