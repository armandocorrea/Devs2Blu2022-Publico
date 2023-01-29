program Pedido;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UfrmCompradores in 'UfrmCompradores.pas' {frmCompradores},
  UdmPedidos in 'UdmPedidos.pas' {dmPedidos: TDataModule},
  UfrmProdutos in 'UfrmProdutos.pas' {frmProdutos},
  UfrmUnidadeMedida in 'UfrmUnidadeMedida.pas' {frmUnidadeMedida},
  UfrmFornecedores in 'UfrmFornecedores.pas' {frmFornecedores},
  UfrmPedidos in 'UfrmPedidos.pas' {frmPedidos},
  UfrmRelUnidadeMedida in 'UfrmRelUnidadeMedida.pas' {frmRelUnidadeMedida},
  UfrmRelCompradores in 'UfrmRelCompradores.pas' {frmRelCompradores},
  UfrmRelFornecedores in 'UfrmRelFornecedores.pas' {frmRelFornecedores},
  UfrmRelPedidos in 'UfrmRelPedidos.pas' {frmRelPedidos};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TdmPedidos, dmPedidos);
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmRelPedidos, frmRelPedidos);
  Application.CreateForm(TfrmRelUnidadeMedida, frmRelUnidadeMedida);
  Application.CreateForm(TfrmRelCompradores, frmRelCompradores);
  Application.CreateForm(TfrmRelFornecedores, frmRelFornecedores);
  Application.CreateForm(TfrmRelPedidos, frmRelPedidos);
  Application.Run;
end.
