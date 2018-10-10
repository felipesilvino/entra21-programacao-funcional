unit URepositorioPessoa;

interface

uses
    Generics.Collections
  , UPessoa
  ;

type
  TOnAtualizouPessoas = procedure (const coListaPessoas: TArray<TPessoa>) of object;

  {
    Está classe deve ser utilizada como um Singleton.
  }
  TRepositorioPessoa = class
  private
    class var FObjetoUnico: TRepositorioPessoa;
    FListaPessoas: TObjectList<TPessoa>;
    FListaObservadores: TList<TOnAtualizouPessoas>;

    procedure AvisaObservadores;

    constructor Create;
  public
    destructor Destroy; override;

    procedure AdicionaPessoa(const Pessoa: TPessoa);
    procedure RemovePessoa(const Pessoa: TPessoa);

    procedure RegistraObservador(const OnAtualizouPessoas: TOnAtualizouPessoas);
    procedure RemoveObservador(const OnAtualizouPessoas: TOnAtualizouPessoas);

    function RetornaListaPessoas: TArray<TPessoa>;

    class function RetornoUnico: TRepositorioPessoa;
  end;

implementation

uses
    SysUtils
  ;

{ TRepositorioPessoa }

procedure TRepositorioPessoa.AvisaObservadores;
var
  OnAtualizouPessoas: TOnAtualizouPessoas;
begin
  for OnAtualizouPessoas in FListaObservadores do
  begin
    //Fazendo a chamado do metodo.
    OnAtualizouPessoas(RetornaListaPessoas);
  end;
end;

constructor TRepositorioPessoa.Create;
begin
  FListaPessoas      := TObjectList<TPessoa>.Create;
  FListaObservadores := TList<TOnAtualizouPessoas>.Create;
end;

destructor TRepositorioPessoa.Destroy;
begin
  FreeAndNil(FListaPessoas);
  FreeAndNil(FListaObservadores);
  inherited;
end;

procedure TRepositorioPessoa.AdicionaPessoa(const Pessoa: TPessoa);
begin
  FListaPessoas.Add(Pessoa);
  AvisaObservadores;
end;

procedure TRepositorioPessoa.RegistraObservador(
  const OnAtualizouPessoas: TOnAtualizouPessoas);
begin
  FListaObservadores.Add(OnAtualizouPessoas);
end;

procedure TRepositorioPessoa.RemoveObservador(
  const OnAtualizouPessoas: TOnAtualizouPessoas);
begin
  FListaObservadores.Remove(OnAtualizouPessoas);
end;

procedure TRepositorioPessoa.RemovePessoa(const Pessoa: TPessoa);
begin
  FListaPessoas.Remove(Pessoa);
  AvisaObservadores;
end;

function TRepositorioPessoa.RetornaListaPessoas: TArray<TPessoa>;
begin
  Result := FListaPessoas.ToArray;
end;

class function TRepositorioPessoa.RetornoUnico: TRepositorioPessoa;
begin
  if not Assigned(FObjetoUnico) then
  begin
    FObjetoUnico := TRepositorioPessoa.Create;
  end;

  Result := FObjetoUnico;
end;

end.
