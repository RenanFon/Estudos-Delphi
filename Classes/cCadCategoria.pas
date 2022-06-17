unit cCadCategoria;

interface


uses
    System.Classes,
    Vcl.Controls,
    vcl.ExtActns,
    vcl.Dialogs,
    ZAbstractConnection,
    ZConnection;

type
    TCategoria = class
        private
            conexaoDB: TZConnection ;
            F_categoriaID: integer;       //int
            F_descricao  : String;
            function getcategoriaId: integer;
            function getdescricao: String;
            procedure setcodigo(const Value: integer);
            procedure setdescricao(const Value: String );
            function getcodigo: integer;        //varchar
        public
            constructor Create(aConexao: TZConnection );
            destructor Destroy; override;
            function  Inserir:Boolean;
            function Atualizar: Boolean;
            function Seleciona(id:integer):Boolean;
            function Apagar: Boolean;
        published
             property codigo:integer read getcodigo write setcodigo;
             property descricao:String read getdescricao write setdescricao;
    end;

implementation
{ TCategoria }

{$region 'Construtors e Destructors'}
constructor TCategoria.Create(aConexao: TZConnection );
begin
     conexaoDB := aConexao;
end;

destructor TCategoria.Destroy;
begin
  inherited;
end;
{$endregion}

{$region 'Cruds'}

function TCategoria.Apagar: Boolean;
begin
     showmessage('apagado');
     result := true;
end;

function TCategoria.Atualizar: Boolean;
begin
     showmessage('Atualizado');
end;

function TCategoria.Inserir: Boolean;
begin
     showmessage('gravado');
end;

function TCategoria.Seleciona(id: integer): Boolean;
begin
    result := true;
end;
{$endregion}


{$region 'geters'}
function TCategoria.getcategoriaId: integer;
    begin

    end;

function TCategoria.getcodigo: integer;
    begin
       Result := Self.F_categoriaID;
    end;

function TCategoria.getdescricao: String;
    begin
       Result := self.F_descricao;
    end;

{$endregion}


{$region 'seters'}
procedure TCategoria.setcodigo(const Value: integer);
    begin
        Self.F_categoriaID := value ;
    end;

procedure TCategoria.setdescricao(const Value: String);
    begin
       Self.F_descricao := value;
    end;
 {$endregion}

end.
