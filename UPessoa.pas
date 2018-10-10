unit UPessoa;

interface

type
  TTipoPessoa = (
    tpFuncionario,
    tpCliente
  );

  TPessoa = class
  protected
    FNome: String;
    FInscricaoFederal: String;

  public
    constructor Create(const Nome: String;
                       const InscricaoFederal: String);

    property NOME: String read FNome;
    property INSCRICAO_FEDERAL: String read FInscricaoFederal;

    { Método Fabrica }
    class function RetornaNovaPessoa(const TipoPessoa: TTipoPessoa;
                                     const Nome, InscricaoFederal: String;
                                     const Valor: Double): TPessoa;
  end;

resourcestring
  STR_FUNCIONARIO = 'Funcionario';
  STR_CLIENTE     = 'Cliente';

const
  CNT_DESCRICAO_TIPO_PESSOA: Array[TTipoPessoa] of String = (
      STR_FUNCIONARIO
    , STR_CLIENTE
  );

implementation

uses
    UCliente
  , UFuncionario
  ;

{ TPessoa }

constructor TPessoa.Create(const Nome, InscricaoFederal: String);
begin
  FNome := Nome;
  FInscricaoFederal := InscricaoFederal;
end;

class function TPessoa.RetornaNovaPessoa(const TipoPessoa: TTipoPessoa;
  const Nome, InscricaoFederal: String; const Valor: Double): TPessoa;
begin
  case TipoPessoa of
    tpFuncionario: Result := TFuncionario.Create(Nome, InscricaoFederal, Valor);
        tpCliente: Result := TCliente.Create(Nome, InscricaoFederal, Valor);
  else
    Result := nil;
  end;
end;

end.
