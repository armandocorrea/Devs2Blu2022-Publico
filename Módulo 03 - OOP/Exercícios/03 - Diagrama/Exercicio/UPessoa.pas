unit UPessoa;

interface

type
  TPessoa = class
    private
      FNome: String;
      FEndereco: String;
      FCEP: String;
      FTelefone: String;
      FRenda: Currency;
      FSituacao: Byte;

      function GetCEP: String;
      function GetEndereco: String;
      function GetNome: String;
      function GetRenda: Currency;
      function GetSituacao: Byte;
      function GetTelefone: String;

      procedure SetCEP(const Value: String);
      procedure SetEndereco(const Value: String);
      procedure SetNome(const Value: String);
      procedure SetRenda(const Value: Currency);
      procedure SetSituacao(const Value: Byte);
      procedure SetTelefone(const Value: String);
    public
      function RegistrarPessoa: Boolean; virtual; abstract;

      property Nome: String     read GetNome     write SetNome;
      property Endereco: String read GetEndereco write SetEndereco;
      property CEP: String      read GetCEP      write SetCEP;
      property Telefone: String read GetTelefone write SetTelefone;
      property Renda: Currency  read GetRenda    write SetRenda;
      property Situacao: Byte   read GetSituacao write SetSituacao;
  end;

  TPessoaFisica = class(TPessoa)
    private
      FCPF: String;

      function GetCPF: String;
      function ValidarCPF: Boolean;

      procedure SetCPF(const Value: String);
    public
      function RegistrarPessoa: Boolean; override;

      property CPF: String read GetCPF write SetCPF;
  end;

  TPessoaJuridica = class(TPessoa)
    private
      FCNPJ: String;

      function GetCNPJ: String;
      function ValidarCNPJ: Boolean;

      procedure SetCNPJ(const Value: String);
    public
      function RegistrarPessoa: Boolean; override;

      property CNPJ: String read GetCNPJ write SetCNPJ;
  end;

implementation

uses
  System.SysUtils, Vcl.Dialogs;

{ TPessoa }

function TPessoa.GetCEP: String;
begin
  Result := FCEP;
end;

function TPessoa.GetEndereco: String;
begin
  Result := FEndereco;
end;

function TPessoa.GetNome: String;
begin
  Result := FNome;
end;

function TPessoa.GetRenda: Currency;
begin
  Result := FRenda;
end;

function TPessoa.GetSituacao: Byte;
begin
  Result := FSituacao;
end;

function TPessoa.GetTelefone: String;
begin
  Result := FTelefone;
end;

procedure TPessoa.SetCEP(const Value: String);
begin
  FCEP := Value;
end;

procedure TPessoa.SetEndereco(const Value: String);
begin
  FEndereco := Value;
end;

procedure TPessoa.SetNome(const Value: String);
begin
  FNome := Value;
end;

procedure TPessoa.SetRenda(const Value: Currency);
begin
  FRenda := Value;
end;

procedure TPessoa.SetSituacao(const Value: Byte);
begin
  FSituacao := Value;
end;

procedure TPessoa.SetTelefone(const Value: String);
begin
  FTelefone := Value;
end;

{ TPessoaFisica }

function TPessoaFisica.GetCPF: String;
begin
  Result := FCPF;
end;

function TPessoaFisica.RegistrarPessoa: Boolean;
const
  C_MENSAGEM = 'Dados Gravados - Nome: %s Endereço: %s ' +
               'CEP: %s Telefone: %s Renda: %s Situação: %d CPF: %s.';
begin
  if not Self.ValidarCPF then
    raise Exception.Create('CPF Inválido!');

  ShowMessage(
    Format(C_MENSAGEM, [Self.Nome,
                        Self.Endereco,
                        Self.CEP,
                        Self.Telefone,
                        FormatCurr('##.###.##0.00', Self.Renda),
                        Self.Situacao,
                        Self.CPF]));
end;

procedure TPessoaFisica.SetCPF(const Value: String);
begin
  FCPF := Value;
end;

function TPessoaFisica.ValidarCPF: Boolean;
var
  I: Integer;
  xMultiplicador: Integer;
  xSoma: Integer;
  xResto: Integer;
  xDV: Integer;
begin
  Result := False;

  //VALIDAÇÕES
  //https://www.devmedia.com.br/validando-o-cpf-em-uma-aplicacao-delphi/22180
  //Aqui pode validar se tem somente números
  //Se possui somente 11 numeros e etc...
  //Se todos os numeros são iguais ex.: 11111111111
  //Fiz apenas um para exemplificar

  if Length(FCPF) = 11 then
  begin
    //DV 1
    xSoma          := 0;
    xMultiplicador := 10;

    for I := 1 to 9 do
    begin
      xSoma := xSoma + (StrToInt(FCPF[I]) * xMultiplicador);
      Dec(xMultiplicador);
    end;

    xResto := xSoma mod 11;

    if (xResto = 10) or (xResto = 11) then
      xResto := 0;

    xDV := 11 - xResto;

    if xDV <> StrToInt(FCPF[10]) then
      raise Exception.Create('CPF Inválido!');

    //DV2
    xSoma          := 0;
    xMultiplicador := 11;

    for I := 1 to 10 do
    begin
      xSoma := xSoma + (StrToInt(FCPF[I]) * xMultiplicador);
      Dec(xMultiplicador);
    end;

    xResto := xSoma mod 11;

    if (xResto = 10) or (xResto = 11) then
      xResto := 0;

    xDV := 11 - xResto;

    if xDV <> StrToInt(FCPF[11]) then
      raise Exception.Create('CPF Inválido!');

    Result := True;
  end;
end;

{ TPessoaJuridica }

function TPessoaJuridica.GetCNPJ: String;
begin
  Result := FCNPJ;
end;

function TPessoaJuridica.RegistrarPessoa: Boolean;
const
  C_MENSAGEM = 'Dados Gravados - Nome: %s Endereço: %s ' +
               'CEP: %s Telefone: %s Renda: %s Situação: %d CNPJ: %s.';
begin
  if not Self.ValidarCNPJ then
    raise Exception.Create('CPF Inválido!');

  ShowMessage(
    Format(C_MENSAGEM, [Self.Nome,
                        Self.Endereco,
                        Self.CEP,
                        Self.Telefone,
                        FormatCurr('##.###.##0.00', Self.Renda),
                        Self.Situacao,
                        Self.CNPJ]));

end;

procedure TPessoaJuridica.SetCNPJ(const Value: String);
begin
  FCNPJ := Value;
end;

function TPessoaJuridica.ValidarCNPJ: Boolean;
var
  I: Integer;
  xMultiplicador: Integer;
  xSoma: Integer;
  xResto: Integer;
  xDV: Integer;
begin
  Result := False;

  //VALIDAÇÕES
  //https://www.devmedia.com.br/validando-o-cnpj-em-uma-aplicacao-delphi/22372#:~:text=O%20CNPJ%20%C3%A9%20um%20n%C3%BAmero,do%20CNPJ%20como%20um%20todo.
  //Aqui pode validar se tem somente números
  //Se possui somente 14 numeros e etc...
  //Fiz apenas um para exemplificar

  if Length(FCNPJ) = 14 then
  begin
    //DV 1
    xSoma          := 0;
    xMultiplicador := 2;

    for I := 12 downto 1 do
    begin
      if xMultiplicador = 10 then
        xMultiplicador := 2;

      xSoma := xSoma + (StrToInt(FCNPJ[I]) * xMultiplicador);
      Inc(xMultiplicador);
    end;

    xResto := xSoma mod 11;

    if (xResto = 0) or (xResto = 1) then
      xResto := 0;

    xDV := 11 - xResto;

    if xDV <> StrToInt(FCNPJ[13]) then
      raise Exception.Create('CNPJ Inválido!');

    //DV2
    xSoma          := 0;
    xMultiplicador := 2;

    for I := 13 downto 1 do
    begin
      if xMultiplicador = 10 then
        xMultiplicador := 2;

      xSoma := xSoma + (StrToInt(FCNPJ[I]) * xMultiplicador);
      Inc(xMultiplicador);
    end;

    xResto := xSoma mod 11;

    if (xResto = 0) or (xResto = 1) then
      xResto := 0;

    xDV := 11 - xResto;

    if xDV <> StrToInt(FCNPJ[14]) then
      raise Exception.Create('CNPJ Inválido!');

    Result := True;
  end;
end;

end.
