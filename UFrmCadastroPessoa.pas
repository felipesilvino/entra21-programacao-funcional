unit UFrmCadastroPessoa;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, PwCtrls
  , UPessoa
  ;

type
  TFrmCadastroPessoa = class(TForm)
    gbInformacoesPessoa: TGroupBox;
    lbNome: TLabel;
    edNome: TEdit;
    lbSalario: TLabel;
    edSalario: TFloatEdit;
    Panel1: TPanel;
    pnlBotoes: TPanel;
    btnGravar: TButton;
    lbLimiteCredito: TLabel;
    edLimiteCredito: TFloatEdit;
    edInscricaoFederal: TEdit;
    lbInscricaoFederal: TLabel;
    rgTipoPessoa: TRadioGroup;
    btnSair: TButton;
    procedure FormCreate(Sender: TObject);
    procedure rgTipoPessoaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSairClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
  private
    FTipoPessoa: TTipoPessoa;
  end;

var
  FrmCadastroPessoa: TFrmCadastroPessoa;

implementation

{$R *.dfm}

uses
    Math
  , URepositorioPessoa
  ;

procedure TFrmCadastroPessoa.btnGravarClick(Sender: TObject);
var
  Pessoa: TPessoa;
  Valor: Double;
begin
  Valor := ifthen(FTipoPessoa = tpFuncionario, edSalario.FloatNumber
                                             , edLimiteCredito.FloatNumber);
  Pessoa := TPessoa.RetornaNovaPessoa(FTipoPessoa
                                    , edNome.Text
                                    , edInscricaoFederal.Text
                                    , Valor);

  try
    TRepositorioPessoa.RetornoUnico.AdicionaPessoa(Pessoa);

    edNome.Clear;
    edInscricaoFederal.Clear;

    rgTipoPessoa.ItemIndex      := 0;
    edSalario.FloatNumber       := 0;
    edLimiteCredito.FloatNumber := 0;

    edNome.SetFocus;
  except
    on E: Exception do
    begin
      ShowMessage(E.Message);
    end;
  end;
end;

procedure TFrmCadastroPessoa.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TFrmCadastroPessoa.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TFrmCadastroPessoa.FormCreate(Sender: TObject);
var
  TipoPessoa: TTipoPessoa;
begin
  rgTipoPessoa.Items.Clear;
  for TipoPessoa := Low(TTipoPessoa) to High(TTipoPessoa) do
  begin
    rgTipoPessoa.Items.Add(CNT_DESCRICAO_TIPO_PESSOA[TipoPessoa])
  end;

  rgTipoPessoa.ItemIndex := 0;
end;

procedure TFrmCadastroPessoa.rgTipoPessoaClick(Sender: TObject);
begin
  FTipoPessoa := TTipoPessoa(rgTipoPessoa.ItemIndex);

  lbSalario.Visible := FTipoPessoa = tpFuncionario;
  edSalario.Visible := lbSalario.Visible;

  lbLimiteCredito.Visible := FTipoPessoa = tpCliente;
  edLimiteCredito.Visible := lbLimiteCredito.Visible;
end;

end.
