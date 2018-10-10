unit UCliente;

interface

uses
  UPessoa;

type
  TCliente = class(TPessoa)
  private
    FLimiteCredito: Double;

  public
    constructor Create(const Nome: String;
                       const InscricaoFederal: String;
                       const LimiteCredito: Double); overload;
    constructor Create(const Nome: String;
                       const InscricaoFederal: String); overload;

    property LIMITE_CREDITO: Double read FLimiteCredito write FLimiteCredito;
  end;
implementation

{ TCliente }

constructor TCliente.Create(const Nome, InscricaoFederal: String);
begin
  Create(Nome, InscricaoFederal, 0);
end;

constructor TCliente.Create(const Nome, InscricaoFederal: String;
  const LimiteCredito: Double);
begin
  Inherited Create(Nome, InscricaoFederal);
  FLimiteCredito := LimiteCredito;
end;

end.
