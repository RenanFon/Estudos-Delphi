unit cCadCategoria;

interface


uses
    System.Classes,
    Vcl.Controls,
    vcl.ExtActns,
    vcl.Dialogs,
    ZAbstractConnection,
    ZConnection,
    ZAbstractRODataset,
    ZAbstractDataset,
    ZDataset,
    System.SysUtils;

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
    Var Qry: TZquery;
    begin
        if messageDlg('Apagar o Registro : '+#13+#13+
                      'Código: '+IntToStr(F_categoriaID)+#13+
                      'Descricao:'+F_descricao,mtConfirmation,[mbYes,mbNo],0)=mrNo then
             BEGIN
                 Result := false;
                 abort;
             END;

        try
            Result := True;
            Qry := TZquery.Create(nil);
            Qry.Connection := conexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add('DELETE FROM categorias   '+
                         ' WHERE categoriaID = :categoriaID');
            Qry.ParamByName('categoriaID').AsInteger:= F_categoriaID;
                try
                    Qry.ExecSQL;
                Except
                     Result:= False;
                end;
        finally
            if Assigned(Qry) then
            FreeAndNil(Qry);
        end;

    end;
end;

function TCategoria.Atualizar: Boolean;
begin
    Var Qry: TZquery;
    begin
        try
            Result := True;
            Qry := TZquery.Create(nil);
            Qry.Connection := conexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add('UPDATE categorias   '+
                         ' SET descricao = :descricao ' +
                         ' WHERE categoriaID = :categoriaID');
            Qry.ParamByName('categoriaID').AsInteger:= self.F_categoriaID;
            Qry.ParamByName('descricao').AsString   := self.F_descricao;
                try
                    Qry.ExecSQL;
                Except
                     Result:= False;
                end;
        finally
            if Assigned(Qry) then
            FreeAndNil(Qry);
        end;

    end;
end;

function TCategoria.Inserir: Boolean;
   Var Qry: TZquery;
    begin
        try
            Result := True;
            Qry := TZquery.Create(nil);
            Qry.Connection := conexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add('INSERT INTO categorias(descricao) VALUES (:descricao)');
            Qry.ParamByName('descricao').Value :=Self.F_descricao;
                try
                    Qry.ExecSQL;
                Except
                     Result:= False;
                end;
        finally
            if Assigned(Qry) then
            FreeAndNil(Qry);
        end;

    end;

function TCategoria.Seleciona(id: integer): Boolean;
begin
    Var Qry: TZquery;
    begin
        try
            Result := True;
            Qry := TZquery.Create(nil);
            Qry.Connection := conexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add('SELECT categoriaID,'+
                         '      descricao   '+
                         'FROM categorias  ' +
                         'WHERE categoriaID = :categoriaID');
            Qry.ParamByName('categoriaID').AsInteger:= id;
                try
                    Qry.Open;
                    Self.F_categoriaID := Qry.FieldByName('categoriaID').AsInteger;
                    self.F_descricao   := Qry.FieldByName('descricao').AsString;
                Except
                     Result:= False;
                end;
        finally
            if Assigned(Qry) then
            FreeAndNil(Qry);
        end;

    end;
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
