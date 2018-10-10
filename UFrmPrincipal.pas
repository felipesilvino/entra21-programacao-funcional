unit UFrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, PwCtrls
  , Generics.Collections
  , UPessoa, Vcl.ComCtrls, Vcl.Menus
  ;

type
  TFrmPrincipal = class(TForm)
    sbProgramacaoFuncional: TStatusBar;
    mmCadastroPessoa: TMainMenu;
    miCadastro: TMenuItem;
    miPessoa: TMenuItem;
    procedure miPessoaClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure AtualizouListaPessoas(const coListaPessoas: TArray<TPessoa>);
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses
    UFrmCadastroPessoa
  , URepositorioPessoa
  ;

resourcestring
  STR_TOTAL_PESSOAS = 'Total de pessoas cadastradas: %d';

{ TFrmPrincipal }

procedure TFrmPrincipal.AtualizouListaPessoas(
  const coListaPessoas: TArray<TPessoa>);
var
  TotalPessoas: Integer;
begin
  TotalPessoas := Length(TRepositorioPessoa.RetornoUnico.RetornaListaPessoas);
  sbProgramacaoFuncional.Panels[0].Text := Format(STR_TOTAL_PESSOAS, [TotalPessoas]);
end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  TRepositorioPessoa.RetornoUnico.RegistraObservador(AtualizouListaPessoas);
end;

procedure TFrmPrincipal.miPessoaClick(Sender: TObject);
begin
  TFrmCadastroPessoa.Create(Self);
end;

end.
