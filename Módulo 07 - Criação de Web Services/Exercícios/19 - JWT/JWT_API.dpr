program JWT_API;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Horse,
  JOSE.Core.JWT,
  JOSE.Core.Builder;

begin
  THorse.Get('/login',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      LToken: TJWT;
      LCompactToken: String;
    begin
      LToken := TJWT.Create;
      try
        //Token Claims
        LToken.Claims.Issuer     := 'Devs2Blu';
        LToken.Claims.Subject    := '123456';
        LToken.Claims.Expiration := Now + 1;

        //Outros Claims
        LToken.Claims.SetClaimOfType<String>('nome', 'armando neto');

        //Signing and Compact format Creation
        LCompactToken := TJOSE.SHA256CompactToken('key', LToken);

        Res.Send(LCompactToken);
      finally
        LToken.Free;
      end;

    end);

  THorse.Listen(9000);
end.

end.
