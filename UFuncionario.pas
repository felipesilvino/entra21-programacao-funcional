unit UFuncionario;

interface

uses
    UPessoa
  ;

type
  TFuncionario = class(TPessoa)
  strict private
    FSalario: Double;

  public
    constructor Create(const Nome: String;
                       const InscricaoFederal: String;
                       const Salario: Double); overload;
    constructor Create(const Nome: String;
                       const InscricaoFederal: String); overload;

    property SALARIO: Double read FSalario write FSalario;
  end;

implementation

{ TFuncionario }


constructor TFuncionario.Create(const Nome, InscricaoFederal: String);
begin
  Create(Nome, InscricaoFederal, 0);
end;

{ TFuncionario }

constructor TFuncionario.Create(const Nome, InscricaoFederal: String;
                                const Salario: Double);
begin
  Inherited Create(Nome, InscricaoFederal);
  FSalario := Salario;
end;

end.
