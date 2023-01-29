unit URefinedAbstractionProdutos;

interface

uses
  UAbstraction, UImplementor;

type
  TExportadorProdutos = class(TInterfacedObject, IExportador)
  private
    FFormato: IFormato;

    procedure EscreverCabecalho;
  public
    constructor Create(aFormato: IFormato);
    procedure ExportarDados(const aDados: olevariant);
  end;

implementation

uses
  System.SysUtils, DBClient;

{ TExportadorProdutos }

constructor TExportadorProdutos.Create(aFormato: IFormato);
begin
  FFormato := aFormato;
end;

procedure TExportadorProdutos.EscreverCabecalho;
begin
  FFormato.DesenharCabecalho('Código');
  FFormato.DesenharCabecalho('Descrição');
  FFormato.DesenharCabecalho('Estoque');
end;

procedure TExportadorProdutos.ExportarDados(const aDados: olevariant);
var
  xCdsDados: TClientDataSet;
  xContador: integer;
begin
  EscreverCabecalho;
  xCdsDados := TClientDataSet.Create(nil);
  try
    xCdsDados.Data := aDados;
    xCdsDados.First;
    while not xCdsDados.Eof do
    begin
      FFormato.PularLinha;
      for xContador := 0 to Pred(xCdsDados.Fields.Count) do
        FFormato.ExportarCampo(xCdsDados.Fields[xContador].AsString);

      xCdsDados.Next;
    end;
    FFormato.SalvarArquivo('Produtos');
  finally
    FreeAndNil(xCdsDados);
  end;
end;

end.
