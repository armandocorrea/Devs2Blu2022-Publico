unit UCargo;

interface

uses
  GBSwagger.Model.Attributes;

type
  TCargo = class
    private
      FId: Integer;
      FDescricao: String;
    public
     [SwagProp('Cargo Id', True)]
     property Id: Integer read FId write FId;

     [SwagProp('Cargo Descricao', True)]
     property Descricao: String read FDescricao write FDescricao;
  end;

  TAPIError = class
    private
      FError: String;
    public
      property Error: String read FError write FError;
  end;

implementation

end.
