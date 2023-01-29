unit UImplementor;

interface

type
  IFormato = interface
    ['{4D5E4625-C483-4A4F-A040-EBF2F55211E6}']
    procedure PularLinha;
    procedure DesenharCabecalho(const aTitulo: String);
    procedure ExportarCampo(const aValor: String);
    procedure SalvarArquivo(const aNomeArquivo: String);
  end;

implementation

end.
