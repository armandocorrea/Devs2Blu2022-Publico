unit UInterfaceHandler;

interface

uses
  DBClient;

type
  IParser = interface
    ['{D1CC71FA-FD22-4B3E-B0C6-3BBF6DAF17E7}']
    procedure SetProximoParser(aParser: IParser);
    procedure ProcessarInclusao(const aNomeArquivo: String; const aDataSet: TClientDataSet);
  end;

implementation

end.
