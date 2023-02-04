program WS_Calculadora;

{$APPTYPE CONSOLE}

uses
  Horse,
  System.SysUtils,
  UCalculadora_Interface in 'UCalculadora_Interface.pas',
  UCalculadora_Impl in 'UCalculadora_Impl.pas';

begin

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  //Somar
  THorse.Get('/somar/:valor1/:valor2',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      xValor1,
      xValor2: Double;
      xCalculadora: ICalculadora;
      xResultado: Double;
    begin
      if Req.Params.Count <> 2 then
      begin
        Res.Send('Parâmetros Incorretos!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
      begin
        Res.Send('Valor 1 Incorreto!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
      begin
        Res.Send('Valor 2 Incorreto!');
        Exit;
      end;

      xCalculadora := TCalculadora.Create;
      xResultado   := xCalculadora.Somar(xValor1, xValor2);

      Res.Send('Soma: ' + xResultado.ToString);
    end);

  //Subtrair
  THorse.Get('/subtrair/:valor1/:valor2',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      xValor1,
      xValor2: Double;
      xCalculadora: ICalculadora;
      xResultado: Double;
    begin
      if Req.Params.Count <> 2 then
      begin
        Res.Send('Parâmetros Incorretos!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
      begin
        Res.Send('Valor 1 Incorreto!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
      begin
        Res.Send('Valor 2 Incorreto!');
        Exit;
      end;

      xCalculadora := TCalculadora.Create;
      xResultado   := xCalculadora.Subtrair(xValor1, xValor2);

      Res.Send('Subtração: ' + xResultado.ToString);
    end);

  //Multiplicação
  THorse.Get('/multiplicar/:valor1/:valor2',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      xValor1,
      xValor2: Double;
      xCalculadora: ICalculadora;
      xResultado: Double;
    begin
      if Req.Params.Count <> 2 then
      begin
        Res.Send('Parâmetros Incorretos!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
      begin
        Res.Send('Valor 1 Incorreto!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
      begin
        Res.Send('Valor 2 Incorreto!');
        Exit;
      end;

      xCalculadora := TCalculadora.Create;
      xResultado   := xCalculadora.Multiplicar(xValor1, xValor2);

      Res.Send('Multiplicação: ' + xResultado.ToString);
    end);

  //Divisão
  THorse.Get('/dividir/:valor1/:valor2',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    var
      xValor1,
      xValor2: Double;
      xCalculadora: ICalculadora;
      xResultado: Double;
    begin
      if Req.Params.Count <> 2 then
      begin
        Res.Send('Parâmetros Incorretos!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor1'], xValor1) then
      begin
        Res.Send('Valor 1 Incorreto!');
        Exit;
      end;

      if not TryStrToFloat(Req.Params.Items['valor2'], xValor2) then
      begin
        Res.Send('Valor 2 Incorreto!');
        Exit;
      end;

      xCalculadora := TCalculadora.Create;
      xResultado   := xCalculadora.Dividir(xValor1, xValor2);

      Res.Send('Divisão: ' + xResultado.ToString);
    end);

  THorse.Listen(9090,
    procedure(Horse: THorse)
    begin
      Writeln('Server is runing on port ' + IntToStr(Horse.Port));
    end);
end.