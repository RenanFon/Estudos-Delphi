unit cCadProduto;

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
        Tproduto = class
       private
            ConexaoDB : TZConnection;
            F_produtoId:integer;
            F_nome:String;
            F_descricao: String;
            F_valor:Double;
            F_quantidade:Double;
            F_categoriaId:Integer;

       Public
            constructor Create(aConexao : TZConnection);
            destructor Destroy; override;
            function Inserir : Boolean;
            function Atualizar : Boolean;
            function Apagar : Boolean;
            function Selecionar(id:Integer):Boolean;
       published
            property codigo  :integer  read F_produtoId write F_produtoId;
            property nome  :String  read F_nome write F_nome;
            property descricao  :String  read F_descricao write F_descricao;
            property valor  :Double  read F_valor write F_valor;
            property quantidade  :Double  read F_quantidade write F_quantidade;
            property categoriaId  :integer  read F_categoriaId write F_categoriaId;
     end;




implementation

{ Tproduto }

{$region 'Constructor e Destructors'}
constructor Tproduto.Create(aConexao: TZConnection);
    begin
        ConexaoDB := aConexao;
    end;

destructor Tproduto.Destroy;
    begin

     inherited;
    end;

{$endregion}

function Tproduto.Inserir: Boolean;
var qry : TZQuery;
    begin
    try
        qry := TZQuery.Create(nil);
        qry.Connection := conexaoDB;
        qry.SQL.Clear;
        qry.SQL.Add('INSERT INTO produtos(nome, '+
                             '               descricao,  '+
                             '               valor,        '+
                             '               quantidade,    '+
                             '               categoriaId)  ' +
                             '  VALUES(      :nome,          '+
                             '               :descricao,     '+
                             '               :valor,        ' +
                             '               :quantidade,   ' +
                             '               :categoriaId )') ;
        qry.ParamByName('nome').AsString          :=self.F_nome;
        qry.ParamByName('descricao').AsString     :=self.F_descricao;
        qry.ParamByName('valor').AsFloat          :=self.F_valor;
        qry.ParamByName('quantidade').AsFloat     :=self.F_quantidade;
        qry.ParamByName('categoriaId').AsInteger  := self.F_categoriaId;
        try
          conexaoDB.StartTransaction;
          Qry.ExecSQL;
          conexaoDB.Commit;
        Except
          conexaoDB.Rollback;
          Result:= False;
          end;
    finally
        if assigned(qry) then
             FreeAndNil(qry);
       end;
    end;

function Tproduto.Selecionar(id: Integer): Boolean;
var qry:TZQuery;
    begin
        try
            Result := true;
            qry:=TZQuery.Create(nil);
            qry.Connection := conexaoDB;
            qry.SQL.Clear;
            qry.SQL.add('SELECT produtoId,'+
                        '  nome,         '+
		                '  descricao,    '+
		                '  valor,        '+
		                '  quantidade,   '+
		                '  categoriaId   '+
                        '  FROM produtos '+
                        '  WHERE produtoId = :produtoId ');
            qry.ParamByName('produtoId').AsInteger :=id;
            try
               qry.Open;
               Self.F_produtoId         :=qry.FieldByName('produtoId').AsInteger;
               Self.F_nome              :=qry.FieldByName('nome').AsString;
               self.F_descricao         :=qry.FieldByName('descricao').AsString;
               self.F_valor             :=qry.FieldByName('valor').AsFloat;
               self.F_quantidade        :=qry.FieldByName('quantidade').AsFloat;
               self.F_categoriaId       :=qry.FieldByName('categoriaId').AsInteger;
            Except
               Result := False;
            end;
        finally
             if Assigned(qry) then
                FreeAndNil(qry);
        end;
    end;

function Tproduto.Apagar: Boolean;
    var qry:TZQuery;
    begin
         if messageDlg('Apagar o Registro :'+#13+#13+
                       'C?digo : '+IntToStr(F_produtoId)+#13+
                       'Descri??o :'+F_nome,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0)=mrNo then
            BEGIN
                Result:= False;
                abort;
            END;

    Try
        Result := True;
        qry:=TZQuery.Create(nil);
        qry.Connection := ConexaoDb;
        qry.SQL.Clear;
        qry.SQL.Add('DELETE FROM produtos '+
                    'WHERE produtoId = :produtoId' );
        qry.ParamByName('produtoId').AsInteger:= F_produtoId;
        try
          conexaoDB.StartTransaction;
          Qry.ExecSQL;
          conexaoDB.Commit;
        Except
          conexaoDB.Rollback;
          Result:= False;
        end;

    Finally
       if Assigned(qry) then
          FreeAndNil(qry);
    End;

    end;

function Tproduto.Atualizar: Boolean;
var qry:TZQuery;
    begin
         try
            Result:= true;
            qry := TZQuery.Create(nil);
            qry.Connection := conexaoDB;
            qry.SQL.Clear;
            qry.SQL.Add('UPDATE produtos                   '+
                        '   SET nome          = :nome       '+
                        '  ,descricao         = :descricao '+
                        '  ,valor             = :valor      '+
                        '  ,quantidade        = :quantidade '+
                        '  ,categoriaId       = :categoriaId'+
                        '  WHERE produtoId    = :produtoId' );
            qry.ParamByName('produtoId').AsInteger   :=self.F_produtoId;
            qry.ParamByName('nome').AsString         :=self.F_nome;
            qry.ParamByName('descricao').AsString    :=self.F_descricao;
            qry.ParamByName('valor').AsFloat         :=self.F_valor;
            qry.ParamByName('quantidade').AsFloat    :=self.F_quantidade;
            qry.ParamByName('categoriaId').AsInteger :=self.F_categoriaId;
           try
              conexaoDB.StartTransaction;
              Qry.ExecSQL;
              conexaoDB.Commit;
          Except
              conexaoDB.Rollback;
              Result:= False;
              end;
          finally
            if  assigned(qry) then
                FreeAndNil(qry);
         end;
    end;

end.
