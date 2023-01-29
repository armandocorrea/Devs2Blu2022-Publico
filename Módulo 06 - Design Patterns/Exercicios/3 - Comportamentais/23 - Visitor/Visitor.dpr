program Visitor;

uses
  Vcl.Forms,
  UfrmPrincipal in 'UfrmPrincipal.pas' {frmPrincipal},
  UInterface_Element in 'pattern\Visitor\UInterface_Element.pas',
  UConcrete_Element_Funcionario in 'pattern\Visitor\UConcrete_Element_Funcionario.pas',
  UConcrete_Element_Programador in 'pattern\Visitor\UConcrete_Element_Programador.pas',
  UConcrete_Element_Gerente in 'pattern\Visitor\UConcrete_Element_Gerente.pas',
  UInterface_Visitor in 'pattern\Visitor\UInterface_Visitor.pas',
  UConcrete_Visitor_Salario in 'pattern\Visitor\UConcrete_Visitor_Salario.pas',
  UConcrete_Visitor_Senioridade in 'pattern\Visitor\UConcrete_Visitor_Senioridade.pas';

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
