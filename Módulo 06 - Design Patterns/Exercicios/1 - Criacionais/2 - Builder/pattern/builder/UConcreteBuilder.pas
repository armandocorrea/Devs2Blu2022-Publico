unit UConcreteBuilder;

interface

uses
  UBuilder, UProduct;

type
  TConcreteBuilder = class(TInterfacedObject, IBuilder)
    private
      FProduct: TProduct;
      FDados: OleVariant;
      FQtdRegistros: Integer;
    public
      constructor Create(aDados: OleVariant);
      destructor Destroy; override;

      //Métodos para criar as "partes" do objeto complexo
      procedure BuildCabecalho;
      procedure BuildDetalhes;
      procedure BuildRodape;

      //Função que retorna o "produto" pronto
      function GetRelatorio: TProduct;
  end;

implementation

uses
  System.SysUtils, DataSnap.DBClient;

{ TConcreteBuilder }

procedure TConcreteBuilder.BuildCabecalho;
begin
  // Preenche o conteúdo HTML referente ao cabeçalho

  FProduct.Adicionar('<html><head><meta charset="UTF-8">');

  // Importação das bibliotecas do Bootstrap
  FProduct.Adicionar('<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">');
  FProduct.Adicionar('<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>');

  FProduct.Adicionar('</head>');
  FProduct.Adicionar('<div class="container">');
  FProduct.Adicionar('<div class="panel panel-default">');
  FProduct.Adicionar('<div class="panel-heading">');
  FProduct.Adicionar('<h4>Relatório de Fornecedores</h4>');
  FProduct.Adicionar('<h4>' + FormatDateTime('dd/mm/yyyy hh:nn:ss', Now) + '</h4>');
  FProduct.Adicionar('</div>');
end;

procedure TConcreteBuilder.BuildDetalhes;
var
  DataSet: TClientDataSet;
begin
  // Preenche o conteúdo HTML referente à tabela de registros
  FProduct.Adicionar('<table class="table table-fixed">');
  FProduct.Adicionar('<thead><tr>');
  FProduct.Adicionar('<th class="col-xs-2">Código</th>');
  FProduct.Adicionar('<th class="col-xs-8">Fornecedor</th>');
  FProduct.Adicionar('<th class="col-xs-2">Cidade</th>');
  FProduct.Adicionar('</tr></thead><tbody>');

  DataSet := TClientDataSet.Create(nil);
  try
    DataSet.Data := FDados;
    DataSet.First;

    // Para cada iteração nos registros do DataSet, criauma linha no HTML
    while not DataSet.Eof do
    begin
      FProduct.Adicionar('<tr>');
      FProduct.Adicionar('<td class="col-xs-2">' + DataSet.FieldByName('VendorNo').AsString + '</td>');
      FProduct.Adicionar('<td class="col-xs-2">' + DataSet.FieldByName('VendorName').AsString + '</td>');
      FProduct.Adicionar('<td class="col-xs-2">' + DataSet.FieldByName('City').AsString + '</td>');
      FProduct.Adicionar('</tr>');

      // Incrementa a variável de quantidade de registros
      Inc(FQtdRegistros);

      DataSet.Next;
    end;

    // Fecha o HTML da tabela
    FProduct.Adicionar('</tbody></table></div></div>');
  finally
    FreeAndNil(DataSet);
  end;
end;

procedure TConcreteBuilder.BuildRodape;
begin
  // Preenche o conteúdo HTML referente ao rodapé
  FProduct.Adicionar('<div id="footer">');
  FProduct.Adicionar('<div class="container">');
  FProduct.Adicionar('<p class="text-center">Qtde de Registros: ' + IntToStr(FQtdRegistros)+ '</p>');
  FProduct.Adicionar('</div></div></body></html>');
end;

constructor TConcreteBuilder.Create(aDados: OleVariant);
begin
  FQtdRegistros := 0;

  //Recebe os dados do formulario como parâmetro
  FDados := aDados;

  //Cria a instancia do Product
  FProduct := TProduct.Create;
end;

destructor TConcreteBuilder.Destroy;
begin
  //Libera a instancia de Product
  FreeAndNil(FProduct);
  inherited;
end;

function TConcreteBuilder.GetRelatorio: TProduct;
begin
  //Devolve o produto pronto que, neste caso, é uma pagina HTML
  Result := FProduct;
end;

end.
