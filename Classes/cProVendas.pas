unit cProVendas;

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
         uEnum,
         cControleEstoque,
         ZDataset,
         Data.DB,
         Datasnap.DBClient,
         System.SysUtils;


type
    Tvenda = class
    private
        ConexaoDB :TZConnection;
        F_vendaId:integer;
        F_clienteId:integer;
        F_dataVenda:TdateTime;
        F_totalVenda: Double;
    function InserirItens(cds: TClientDataSet; idVenda: integer): Boolean;
    function apagarItens(cds: TClientDataSet): Boolean;
    function InNot(cds: TClientDataSet): String;
    function EsteItemExiste(vendaId, produtoId: Integer): Boolean;
    function AtualizarItem(cds: TclientDataSet): Boolean;
    procedure RetornarEstoque(sCodigo: String; Acao: TAcaoExcluirEstoque);
    procedure BaixarEstoque(produtoId: integer; Quantidade: Double);

    public
        constructor Create(aConexao:TZConnection);
        destructor  Destroy;override;
        function Inserir(cds:TClientDataSet):Boolean;
        function Atualizar(cds : TClientDataSet):Boolean;
        function Apagar(id :integer):Boolean;
        function Selecionar(id:integer; var cds :TClientDataSet):Boolean;
    Published
        property VendaId:integer          read F_vendaId      write F_vendaId;
        property ClienteId:integer        read F_ClienteId    write F_clienteId;
        property DataVenda:TdateTime      read F_dataVenda    write F_dataVenda;
        property TotalVenda:Double        read F_TotalVenda   write F_totalVenda;

    end;


implementation



{ Tvenda }

{$region 'CONSTRUCTORS E DESTRUCTORS'}
constructor Tvenda.Create(aConexao: TZConnection);
begin
    ConexaoDB := aConexao;
end;

destructor Tvenda.Destroy;
begin

  inherited;
end;

{$endregion}

function Tvenda.Apagar(id:integer): Boolean;
var qry:TZQuery;
    begin
        if messageDlg('Apagar o Registro : '+#13+#13+
        'Venda Nro:'+IntToStr(Id),mtConfirmation,[mbYes,mbNo],0)=mrNo then
         begin
             Result := false;
             abort;
         end;

         try
             Result := true;
             ConexaoDB.StartTransaction;
             qry    := TZQuery.Create(nil);
             qry.Connection := conexaoDB;
             //apaga os itens primeiro
             qry.SQL.Clear;
             qry.SQL.Add(' DELETE FROM vendasItens '+
                         ' WHERE vendaId = :Id ');
             qry.ParamByName('Id').AsInteger := vendaid;
             try
                 qry.ExecSQL;
                 //apaga a tabela master
                 qry.SQL.Clear;
                 qry.SQL.Add('DELETE FROM vendas '+
                             ' WHERE vendaId = :Id');
                 qry.ParamByName('Id').AsInteger := id;
                 qry.ExecSQL;
                 ConexaoDB.commit;
             Except
                  ConexaoDB.Rollback;
                  Result := False;
             end;
         finally
              if assigned(qry) then
                  FreeAndNil(qry);
         end;
    end;

function Tvenda.Atualizar(cds : TClientDataSet): Boolean;
var qry : TZQuery;
    begin
         try
             Result := true;
             ConexaoDB.StartTransaction;
             qry := TZQuery.Create(nil);
             qry.Connection := ConexaoDB;
             qry.SQL.Clear;
             qry.SQL.Add('UPDATE vendas ' +
                        ' SET clienteId = :clienteId '+
                        '  ,dataVenda = :datavenda '+
                        '  ,totalvenda = :totalvenda'+
                        ' WHERE vendaId = :vendaId');
             qry.ParamByName('vendaId').AsInteger    :=self.F_vendaId;
             qry.ParamByName('clienteId').AsInteger  :=self.F_clienteId;
             qry.ParamByName('dataVenda').AsDateTime :=self.F_dataVenda;
             qry.ParamByName('totalVenda').AsFloat    :=Self.F_totalVenda;

             try
                //Update Vendas
                qry.ExecSQL;

                //Apagar Itens no banco de dados que foram apagadas na tela
                apagarItens(cds);

                cds.First;
                while not cds.Eof do
                    begin
                        if EsteItemExiste(self.F_vendaId, cds.FieldByName('produtoId').AsInteger) then
                            begin
                                AtualizarItem(cds);
                            end
                        Else
                            Begin
                                InserirItens(cds, self.F_vendaId);
                            End;
                        cds.Next;
                    end;
                 ConexaoDB.Commit;
             Except
                 Result := false;
                 ConexaoDB.Rollback;
             end;

             ConexaoDB.Commit;
         finally
             if assigned(qry) then
                FreeAndNil(qry);
         end;

    end;

function Tvenda.AtualizarItem(cds:TclientDataSet): Boolean;
var qry : TZQuery;
    Begin
         try
            Result := true;
            RetornarEstoque(cds.FieldByName('produtoId').AsString, aeeAlterar);
            qry := TZQuery.Create(nil);
            qry.Connection := ConexaoDB;
            qry.SQL.Clear;
            qry.SQL.Add('UPDATE VendasItens '+
                        ' SET ValorUnitario = :ValorUnitario '+
                        ' ,Quantidade = :Quantidade '+
                        ' ,TotalProduto = :TotalProduto'+
                        ' WHERE vendaId = :vendaId AND produtoId = :produtoId');
           qry.ParamByName('vendaId').AsInteger     := self.F_vendaId;
           qry.ParamByName('produtoId').AsInteger   :=cds.FieldByName('produtoId').AsInteger;
           qry.ParamByName('valorUnitario').AsFloat := cds.FieldByName('valorUnitario').AsFloat;
           qry.ParamByName('Quantidade').AsFloat    := cds.FieldByName('quantidade').AsFloat;
           qry.ParamByName('TotalProduto').AsFloat  := cds.FieldByName('valorTotalProduto').AsFloat;
           try
                ConexaoDB.StartTransaction;
                qry.ExecSQL;
                ConexaoDB.Commit;
                BaixarEstoque(cds.FieldByName('produtoId').AsInteger, cds.FieldByName('quantidade').AsFloat);
           Except
                ConexaoDB.Rollback;
                Result := false;
           end;


         finally
            if assigned(qry) then
                FreeAndNil(qry);
         end;
    End;

function Tvenda.EsteItemExiste(vendaId: integer; produtoId: Integer): Boolean;
var qry : TZQuery;
  begin
    try
        qry := TZQuery.Create(nil);
        qry.Connection := ConexaoDB;
        qry.SQL.Clear;
        qry.SQL.Add('SELECT COUNT (vendaId) AS qtde '+
                    '  FROM vendasItens               '+
                    '  WHERE vendaId = :vendaId AND produtoId = :produtoId');
                    //= :vendaId
        qry.ParamByName('vendaId').AsInteger     := vendaId;
        qry.ParamByName('produtoId').AsInteger   := produtoId;
            try
            qry.Open;

                if qry.FieldByName('qtde').AsInteger >0 then
                    Result := true
                else
                    Result := false;
            Except
                Result := False;
            end;
    finally
        if assigned(qry) then
            FreeAndNil(qry);
    end;
  end;


function Tvenda.Inserir(cds:TClientDataSet): Boolean;
var qry:TZQuery;
    IdVendaGerado :integer;
    begin
        try
            Result := True;
            ConexaoDB.StartTransaction;
            qry := TZQuery.Create(nil);
            qry.Connection := ConexaoDB;
            //faz a inclusao no Banco de Dados
            qry.SQL.Clear;
            Qry.SQL.Add('INSERT INTO vendas (clienteId, dataVenda, totalVenda)  '+
                '            VALUES (:clienteId,:dataVenda,:totalVenda )');
            Qry.ParamByName('clienteId').AsInteger  :=Self.F_clienteId;
            Qry.ParamByName('dataVenda').AsDateTime :=Self.F_dataVenda;
            Qry.ParamByName('totalVenda').AsFloat   :=Self.F_totalVenda;

            try
                qry.ExecSQL;
                //Recupera o ID Gerado no Insert
                qry.SQL.Clear;
                qry.SQL.Add('SELECT LAST_INSERT_ID()AS ID');
                qry.Open;

                //id da Tabela Master (venda)
                IdVendaGerado := qry.FieldByName('ID').AsInteger;

                {$region 'Gravar na tabela VendasItens'}
                cds.first;
                    while not cds.Eof do
                    begin
                    InserirItens(cds,IdVendaGerado);
                    cds.Next;
                    end;

                {$endregion}

                ConexaoDB.Commit;
            Except
                ConexaoDB.Rollback;
                result := False;
            end;

        finally
             if assigned(qry) then
                  FreeAndNil(qry);
        end;
    end;

function Tvenda.apagarItens(cds : TClientDataSet): Boolean;
var Qry:TZQuery;
    sCodNoCds : String;
    begin
        try
            Result := true;
            //Pega os codigos que estao no Cliente para Selecionar o In Not no Bnaco de Dados
            sCodNoCds := InNot(cds);
            Qry := TZQuery.Create(nil);
            Qry.Connection := ConexaoDB;
            qry.SQL.Clear;
            qry.SQL.Add(' DELETE '+
                        '   FROM vendasitens ' +
                        '   WHERE vendaId=:vendaId ' +
                        '   AND produtoId NOT IN ('+InNot(cds)+') ');
        Qry.ParamByName('vendaId').AsInteger            := Self.F_vendaId;
            try
                ConexaoDB.StartTransaction;
                Qry.ExecSQL;
                ConexaoDB.Commit;
            except
                ConexaoDB.Rollback;
                Result:= false;
            end;

        finally
            if assigned(qry) then
                FreeAndNil(qry);
        end;

    end;


function Tvenda.InNot(cds:TClientDataSet):String;
var sInNot : String;
    begin
        sInNot := EmptyStr;
        cds.First;
        while not cds.Eof do
            Begin
                if sInNot = EmptyStr then
                    sInNot := cds.FieldByName('produtoId').AsString
                else
                    sInNot := sInNot + ','+cds.FieldByName('produtoId').AsString;
                    cds.Next;
            End;
    end;




//inserindo...
function Tvenda.InserirItens(cds:TClientDataSet; idVenda:integer ): Boolean;
var qry : TZQuery;
    begin
       try
        Result := true;
        qry:=TZQuery.Create(nil);
        qry.Connection := conexaoDB;
        qry.SQL.Clear;
        qry.SQL.Add('INSERT INTO VendasItens ( vendaId, produtoId, valorUnitario, quantidade,totalProduto) '+
                    '             VALUES(:vendaId, :produtoId,:valorUnitario,:quantidade,:totalProduto) ');

        qry.ParamByName('vendaId').AsInteger         := IdVenda;
        qry.ParamByName('produtoID').AsInteger       :=cds.FieldByName('produtoId').AsInteger;
        qry.ParamByName('valorUnitario').AsFloat     :=cds.FieldByName('valorUnitario').AsFloat;
        qry.ParamByName('quantidade').AsFloat        :=cds.FieldByName('quantidade').AsFloat;
        qry.ParamByName('totalProduto').AsFloat      :=cds.FieldByName('valorTotalProduto').AsFloat;
        try
            ConexaoDB.StartTransaction;
           qry.ExecSQL;
           ConexaoDB.Commit;
           BaixarEstoque(cds.FieldByName('produtoId').AsInteger, cds.FieldByName('quantidade').AsFloat);
        Except
            ConexaoDB.Rollback;
            Result := False;
        end;
       finally
           if Assigned(Qry) then
            FreeAndNil(Qry);
       end;


    end;

function Tvenda.Selecionar(id: integer;var cds :TClientDataSet): Boolean;
var qry:TZQuery;
    begin
        try
            Result := true;
            qry := TZQuery.Create(nil);
            qry.Connection := ConexaoDB;
            qry.SQL.Clear;
            qry.SQL.ADD('SELECT vendaId '+
                 '     ,clienteId      '  +
                 '     ,dataVenda      ' +
                 '     ,totalVenda     ' +
                 '   FROM vendas   '+
                 '   WHERE vendaId = :vendaId' );
           qry.ParamByName('vendaId').AsInteger := Id;

           try
              qry.Open;

              Self.F_vendaId        :=qry.FieldByName('vendaId').AsInteger;
              self.F_clienteId      :=qry.FieldByName('clienteId').AsInteger;
              Self.F_dataVenda      :=qry.FieldByName('dataVenda').AsDateTime;
              self.F_totalVenda     :=qry.FieldByName('totalVenda').AsFloat;

             {$region 'SELECIONAR na Tabela vendas'}
             //apaga o Cliente SET
             cds.First;
             while not cds.Eof do
                begin
                    cds.Delete;
                end;



            //Seleciona os itens do Banco de dados com a propriedade
            qry.Close;
            qry.SQL.Clear;
            qry.SQL.Add('SELECT vendasItens.produtoId, '+
                '        produtos.nome,       '+
                '        vendasitens.valorUnitario, '+
                '        vendasitens.quantidade, '+
                '        vendasitens.TotalProduto '+
                '     FROM vendasitens  '+
                '        INNER JOIN produtos ON produtos.produtoId = vendasitens.produtoId'+
                '  WHERE vendasitens.vendaId = :VendaId ' );
            qry.ParamByName('vendaId').AsInteger        :=Self.F_vendaId;
            qry.Open;


            //le a Query e Coloca no ClientDataSet
            qry.First;
            while not qry.Eof do
                begin
                    cds.Append;
                    cds.FieldByName('produtoId').AsInteger       :=qry.FieldByName('produtoId').AsInteger;
                    cds.FieldByName('nomeProduto').AsString      :=qry.FieldByName('nome').AsString;
                    cds.FieldByName('valorUnitario').AsFloat     :=qry.FieldByName('valorUnitario').AsFloat;
                    cds.FieldByName('quantidade').AsFloat        :=qry.FieldByName('quantidade').AsFloat;
                    cds.FieldByName('valorTotalProduto').AsFloat :=qry.FieldByName('totalProduto').AsFloat;
                    cds.Post;
                    qry.Next;
                end;
             {$endregion}

           except
               Result := false;
           end;


        finally
            if assigned(qry) then
                FreeAndNil(qry);
        end;
    end;

procedure  Tvenda.RetornarEstoque(sCodigo: String ; Acao:TAcaoExcluirEstoque);
var qry:TZQuery;
    oControleEstoque: TControleEstoque;
    begin
        qry := TZQuery.Create(nil);
        qry.Connection:= ConexaoDB;
        qry.SQL.Clear;
        qry.SQL.Add(   ' SELECT produtoId, quantidade '+
                       ' FROM VendasItens '+
                       ' WHRE VendaId = :vendaId ');
        if Acao = aeeApagar then
            qry.SQL.Add(' AND produtoId NOT IN ('+scodigo+') ')
        else
            qry.SQL.Add(' AND produtoId = ('+scodigo+') ');
        qry.ParamByName('vendaId').AsInteger     :=Self.F_vendaId;
        try
          oControleEstoque := TControleEstoque.Create(ConexaoDB);
          qry.Open;
          qry.First;
          while not qry.Eof do
            begin
                oControleEstoque.ProdutoId   :=qry.FieldByName('produtoId').AsInteger;
                oControleEstoque.quantidade  := qry.FieldByName('quantidade').AsFloat;
                qry.Next;
            end;
        finally
            if assigned(qry) then
                FreeAndNil(oControleEstoque);
        end;

    end;

Procedure Tvenda.BaixarEstoque(produtoId: integer; Quantidade : Double);
var oControleEstoque: TControleEstoque;
    begin
        try
            oControleEstoque:= TControleEstoque.Create(ConexaoDB);
            oControleEstoque.ProdutoId   :=produtoId;
            oControleEstoque.Quantidade  := Quantidade;
            oControleEstoque.BaixarEstoque;
        finally
            if assigned(oControleEstoque) then
                FreeAndNil(oControleEstoque);
        end;
    end;



end.
