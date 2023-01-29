unit UBuilder;

interface

uses
  UProduct;

type
  IBuilder = interface
    ['{A697ED90-E54B-4F07-9AFF-85E6B423803A}']

    //Métodos para criar as "partes" do objeto complexo
    procedure BuildCabecalho;
    procedure BuildDetalhes;
    procedure BuildRodape;

    //Função que retorna o "produto" pronto
    function GetRelatorio: TProduct;
  end;

implementation

end.
