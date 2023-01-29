unit UDecorator;

interface

uses
  UInterfaceComponent;

type
  TDecorator = class(TInterfacedObject, ILogExcecao)
    protected
      FLogExcecao: ILogExcecao;

      function ObterDadosExcecao: String; virtual;
    public
      constructor Create(aLogExcecao: ILogExcecao);
  end;

implementation

{ TDecorator }

constructor TDecorator.Create(aLogExcecao: ILogExcecao);
begin
  FLogExcecao := aLogExcecao;
end;

function TDecorator.ObterDadosExcecao: String;
begin
  Result := FLogExcecao.ObterDadosExcecao;
  Result := Result + #13#10;
end;

end.
