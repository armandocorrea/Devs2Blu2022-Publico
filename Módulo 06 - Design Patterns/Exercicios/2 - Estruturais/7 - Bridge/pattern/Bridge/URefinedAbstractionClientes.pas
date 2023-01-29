unit URefinedAbstractionClientes;

interface

uses
  UAbstraction, UImplementor;

type
  TExportadorClientes = class(TInterfacedObject, IExportador)
    private
      FFormato: IFormato;
      procedure EscreverCabecalho;
    public
      constructor Create(aFormato: IFormato);
      procedure ExportarDados(const aDados: Olevariant);
  end;

implementation

uses
  System.SysUtils, DBClient;

{ TExportadorClientes }

constructor TExportadorClientes.Create(aFormato: IFormato);
begin
  FFormato := aFormato;
end;

procedure TExportadorClientes.EscreverCabecalho;
begin
  FFormato.DesenharCabecalho('Código');
  FFormato.DesenharCabecalho('Nome');
  FFormato.DesenharCabecalho('Cidade');
end;

procedure TExportadorClientes.ExportarDados(const aDados: Olevariant);
var
  xCdsDados: TClientDataSet;
  xContador: Integer;
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
    FFormato.SalvarArquivo('Clientes');
  finally
    FreeAndNil(xCdsDados);
  end;
end;

end.
