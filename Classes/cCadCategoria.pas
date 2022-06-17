unit cCadCategoria;

interface


uses
    System.Classes,
    Vcl.Controls,
    vcl.ExtActns,
    vcl.Dialogs;

type
    TCategoria = class
        private
         F_categoriaID: integer;       //int
         F_descricao  : String;
    function getcategoriaId: integer;
    function getdescricao: String;
    procedure setcodigo(const Value: integer);
    procedure setdescricao(const Value: String );
    function getcodigo: integer;        //varchar

        public
            constructor Create;
            destructor Destroy; override;

        published
              property codigo:integer read getcodigo write setcodigo;
              property descricao:String read getdescricao write setdescricao;


    end;

implementation


{ TCategoria }

constructor TCategoria.Create;
begin
    showmessage('Fui Criado');
end;

destructor TCategoria.Destroy;
begin
     showmessage('Fui Eliminado');
  inherited;
end;




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

procedure TCategoria.setcodigo(const Value: integer);
    begin
        Self.F_categoriaID := value ;
    end;

procedure TCategoria.setdescricao(const Value: String);
    begin
       Self.F_descricao := value;
    end;

end.
