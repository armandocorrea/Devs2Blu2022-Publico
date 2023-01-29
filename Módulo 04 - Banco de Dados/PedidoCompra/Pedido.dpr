program Pedido;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UfrmCompradores in 'UfrmCompradores.pas' {frmCompradores},
  UdmPedidos in 'UdmPedidos.pas' {dmPedidos: TDataModule},
  UfrmProdutos in 'UfrmProdutos.pas' {frmProdutos},
  UfrmUnidadeMedida in 'UfrmUnidadeMedida.pas' {frmUnidadeMedida},
  UfrmFornecedores in 'UfrmFornecedores.pas' {frmFornecedores},
  UfrmPedidos in 'UfrmPedidos.pas' {frmPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPedidos, dmPedidos);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
