unit UCliente;

interface

type
  TCliente = class
    private
      FCodigo: Integer;
      FNome: String;
      FEndereco: String;
      FPais: String;
      FEmail: String;
    public
      property Codigo: Integer  read FCodigo   write FCodigo;
      property Nome: String     read FNome     write FNome;
      property Endereco: String read FEndereco write FEndereco;
      property Pais: String     read FPais     write FPais;
      property Email: String    read FEmail    write FEmail;
  end;

implementation

end.
