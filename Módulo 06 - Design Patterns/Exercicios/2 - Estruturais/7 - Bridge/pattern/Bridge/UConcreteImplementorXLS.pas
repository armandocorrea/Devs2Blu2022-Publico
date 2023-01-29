unit UConcreteImplementorXLS;

interface

uses
  UImplementor, ExcelXP;

type
  TFormatoXLS = class(TInterfacedObject, IFormato)
  private
    FExcel: TExcelApplication;
    FLinha: integer;
    FColuna: integer;

    procedure CriarAplicacaoExcel;
  public
    constructor Create;
    destructor Destroy; override;

    // métodos da Interface
    procedure PularLinha;
    procedure DesenharCabecalho(const aTitulo: string);
    procedure ExportarCampo(const aValor: string);
    procedure SalvarArquivo(const aNomeArquivo: string);
  end;

implementation

uses
  System.SysUtils, Vcl.Forms, System.Variants;

{ TFormatoXLS }

constructor TFormatoXLS.Create;
begin
  Self.CriarAplicacaoExcel;

  FLinha  := 1;
  FColuna := 1;
end;

procedure TFormatoXLS.CriarAplicacaoExcel;
begin
  FExcel := TExcelApplication.Create(nil);
  FExcel.Connect;
  FExcel.Workbooks.Add(xlWBATWorksheet, 0);
  FExcel.Visible[0] := True;
end;

procedure TFormatoXLS.DesenharCabecalho(const aTitulo: string);
var
  xCelula: string;
begin
  xCelula:= Chr(64 + FColuna) + IntToStr(FLinha);

  FExcel.Range[xCelula, xCelula].Font.Bold := True;
  FExcel.Range[xCelula, xCelula].Value2    := aTitulo;
  Inc(FColuna);
end;

destructor TFormatoXLS.Destroy;
begin
  FExcel.Disconnect;
  FreeAndNil(FExcel);

  inherited;
end;

procedure TFormatoXLS.ExportarCampo(const aValor: string);
var
  xCelula: string;
begin
  xCelula:= Chr(64 + FColuna) + IntToStr(FLinha);
  FExcel.Range[xCelula, xCelula].Value2 := aValor;
  Inc(FColuna);
end;

procedure TFormatoXLS.PularLinha;
begin
  Inc(FLinha);
  FColuna := 1;
  FExcel.Columns.AutoFit;
end;

procedure TFormatoXLS.SalvarArquivo(const aNomeArquivo: string);
var
  xCaminhoAplicacao: string;
  xNomeCompleto: string;
begin
  xCaminhoAplicacao := ExtractFilePath(Application.ExeName);
  xNomeCompleto := Format('%s%s.xls', [xCaminhoAplicacao, aNomeArquivo]);
  DeleteFile(PWideChar(aNomeArquivo));

  FExcel.ActiveWorkbook.SaveAs(xNomeCompleto,
      xlNormal, EmptyStr, EmptyStr, False, False, xlNoChange,
      xlUserResolution, False, EmptyParam, EmptyParam, 0, 0);
end;

end.
