unit UInterfaces;

interface

type
  INotebook = interface
    ['{44552C0C-4F7B-4F96-9D07-A30946261AD9}']
    function BuscarTamanhoTela: String;
    function BuscarMemoriaRAM: String;
  end;

  IDesktop = interface
    ['{F8D33800-6B6A-4062-8487-3866377AF945}']
    function BuscarNomeProcessador: String;
    function BuscarTamanhoHD: String;
  end;

  IFactoryMarca = interface
    ['{6C77FA0E-FA2B-4388-A409-C0FD55F3CC79}']
    function ConsultarNotebook: INotebook;
    function ConsultarDesktop: IDesktop;
  end;

implementation

end.
