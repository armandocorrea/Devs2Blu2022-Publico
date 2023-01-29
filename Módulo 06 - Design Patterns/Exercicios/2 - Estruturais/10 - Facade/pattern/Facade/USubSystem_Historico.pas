unit USubSystem_Historico;

interface

type
  TSubsystemHistorico = class
  public
    procedure RegistrarHistoricoDoCalculo(const aDolar, aPreco, aValorVenda: Real);
  end;

implementation

uses
  System.SysUtils;

{ TSubsystemHistorico }

procedure TSubsystemHistorico.RegistrarHistoricoDoCalculo(const aDolar, aPreco,
  aValorVenda: Real);
var
  xArquivo: TextFile;
  xPathArquivo: string;
  xDesconto: string;
begin
  // obtém o caminho e nome do arquivo de histórico
  xPathArquivo := ExtractFilePath(ParamStr(0)) + 'Historico.txt';

  // associa a variável "Arquivo" com o arquivo "Historico.txt"
  AssignFile(xArquivo, xPathArquivo);

  if FileExists(xPathArquivo) then
    // se o arquivo já existe, coloca-o em modo de edição
    Append(xArquivo)
  else
    // caso contrário, cria o arquivo
    Rewrite(xArquivo);

  // escreve os dados no arquivo "Historico.txt"
  WriteLn(xArquivo, 'Data..............: ' + FormatDateTime('dd/mm/yyyy', Now));
  WriteLn(xArquivo, 'Cotação do Dólar..: ' + FormatFloat('###,###,##0.00', aDolar));
  WriteLn(xArquivo, 'Conversão em R$...: ' + FormatFloat('###,###,##0.00', aDolar * aPreco));
  WriteLn(xArquivo, 'Preço final.......: ' + FormatFloat('###,###,##0.00', aValorVenda));

  // fecha o arquivo
  CloseFile(xArquivo);
end;

end.
