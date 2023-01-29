library MinhaDll;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  System.SysUtils,
  System.Classes,
  Vcl.Dialogs;

{$R *.res}

procedure MensagemConfirmacao(AMensagem: WideString); stdCall;
begin
  MessageDlg(AMensagem, mtInformation, [mbOk], 0);
end;

function MeuIntToStr(Numero: Integer): ShortString; stdcall;
begin
  Result := IntToStr(Numero);
  MensagemConfirmacao('Convertido com sucesso!');
end;

function MeuUpperCase(s: ShortString): ShortString; stdcall;
begin
  Result := UpperCase(s);
  MensagemConfirmacao('Texto convertido em Maiúsculas!');
end;

function MeuLowerCase(s: ShortString): ShortString; stdcall;
begin
  Result := LowerCase(s);
  MensagemConfirmacao('Texto convertido em Minúsculas!');
end;

exports
  MeuUpperCase,
  MeuLowerCase,
  MeuIntToStr;

end.
