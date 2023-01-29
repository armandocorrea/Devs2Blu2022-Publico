unit UDirector;

interface

uses
  UBuilder;

type
  TDirector = class
    public
      //Método responsável por construir o objeto complexo por partes
      procedure Construct(aBuilder: IBuilder);
  end;

implementation

{ TDirector }

procedure TDirector.Construct(aBuilder: IBuilder);
begin
  //Sequencia de passos para construir o objeto complexo
  aBuilder.BuildCabecalho;
  aBuilder.BuildDetalhes;
  aBuilder.BuildRodape;
end;

end.
