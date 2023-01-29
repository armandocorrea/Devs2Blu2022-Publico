unit UTipoPrazo;

interface

type
  ITipoPrazo = interface
    ['{E5B12A2B-AC3A-4068-A7B3-48EFF277F2B5}']
    function ConsultarDescricao: String;
    function ConsultarJuros: String;
    function ConsultarProjecao(const aValor: Real; const aQtdParcelas: Integer): String;
    function ConsultarTotal: String;
  end;

  IFactoryMethod = interface
    ['{2EB7F4C2-36F1-4AAE-9C95-A3E84159570A}']
    function ConsultarPrazo(const aPrazo: String): ITipoPrazo;
  end;

implementation

end.
