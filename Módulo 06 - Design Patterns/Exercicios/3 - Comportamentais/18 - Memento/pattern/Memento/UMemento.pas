unit UMemento;

interface

type
  TMemento = class
    private
      FTitulo: String;
      FTexto: WideString;
    public
      //Propriedade referente ao titulo do texto
      property Titulo: String read FTitulo write FTitulo;

      //Propriedade referente ao corpo do texto
      property Texto: WideString read FTexto write FTexto;
  end;

implementation

end.
