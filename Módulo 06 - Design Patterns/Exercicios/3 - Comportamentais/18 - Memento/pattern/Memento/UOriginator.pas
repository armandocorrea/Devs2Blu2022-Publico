unit UOriginator;

interface

uses UMemento;

type
  TOriginator = class
    private
      FTitulo: String;
      FTexto: WideString;
    public
      //Propriedade referente ao titulo do texto
      property Titulo: String read FTitulo write FTitulo;

      //Propriedade referente ao corpo do texto
      property Texto: WideString read FTexto write FTexto;

      //Função que cria, preenche e retorna um Memento
      function SalvarEstado: TMemento;

      //Método que usa o Memento informando no parâmetro para restaurar o estado
      procedure RestaurarEstado(aMemento: TMemento);
  end;


implementation

{ TOriginator }

procedure TOriginator.RestaurarEstado(aMemento: TMemento);
begin
  //Sobrescreve as propriedades com os dados do Memento do parametro
  FTitulo := aMemento.Titulo;
  FTexto  := aMemento.Texto;
end;

function TOriginator.SalvarEstado: TMemento;
begin
  //Cria uma instancia do Memento
  Result := TMemento.Create;

  //Preenche o Objeto
  Result.Titulo := FTitulo;
  Result.Texto  := FTexto;
end;

end.
