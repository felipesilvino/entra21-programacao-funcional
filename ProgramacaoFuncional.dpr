program ProgramacaoFuncional;

uses
  Vcl.Forms,
  UFrmPrincipal in 'UFrmPrincipal.pas' {FrmPrincipal},
  UFuncionario in 'UFuncionario.pas',
  UPessoa in 'UPessoa.pas',
  UFrmCadastroPessoa in 'UFrmCadastroPessoa.pas' {FrmCadastroPessoa},
  URepositorioPessoa in 'URepositorioPessoa.pas',
  UCliente in 'UCliente.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
