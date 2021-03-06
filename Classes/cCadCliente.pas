unit cCadCliente;

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
        TCliente = class
        private
            ConexaoDB: TZconnection;
            F_clienteId: integer;
            F_nome:String;
            F_endereco: string;
            F_cidade : String;
            F_bairro : String;
            F_estado: String;
            F_cep: String;
            F_telefone: String;
            F_email : String;
            F_dataNascimento: TDateTime;
        Published
            constructor Create(aConexao : TZconnection);
            destructor Destroy; override;
            function Inserir: Boolean;
            function Atualizar:Boolean;
            function Apagar: Boolean;
            function Selecionar(id:Integer):Boolean;
        published
            property codigo         :integer    read F_clienteId          write F_clienteId;
            property nome           :string     read F_nome               write F_nome;
            property endereco       :string     read F_endereco           write F_endereco;
            property cidade         :string     read F_cidade             write F_cidade;
            property bairro         :string     read F_bairro             write F_bairro;
            property estado         :string     read F_estado             write F_estado;
            property cep            :string     read F_cep                write F_cep;
            property telefone       :string     read F_telefone           write F_telefone;
            property email          :string     read F_email              write F_email;
            property dataNascimeto  :TDateTime  read F_dataNascimento     write F_dataNascimento;
        end;

implementation


{$region 'Destructors e Constructors'}
constructor TCliente.Create(aConexao: TZconnection);
    begin
        ConexaoDB := aConexao;
    end;

destructor TCliente.Destroy;
begin

  inherited;
end;

{$endregion}

{$region 'CRUD'}
function TCliente.Apagar: Boolean;
var Qry : TZQuery;
    begin
        if messageDlg('Apagar o Registro :'+#13+#13+
                       'C?digo:'+InttoStr(F_clienteId)+#13+
                       'Descricao :'+F_nome,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0)=mrNo then
                            Begin
                                Result := false;
                                abort;
                            End;
         try
            Result := true;
            Qry := TZQuery.Create(nil);
            Qry.Connection := ConexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add('DELETE FROM clientes '+
                        'WHERE clienteId = :clienteId');
            Qry.ParamByName('clienteId').AsInteger :=F_clienteId;
           try
                    conexaoDB.StartTransaction;
                    Qry.ExecSQL;
                    conexaoDB.Commit;
                Except
                     conexaoDB.Rollback;
                     Result:= False;
                end;
         finally
            if Assigned(Qry) then
                FreeAndNil(Qry);
         end;
    end;

function TCliente.Atualizar: Boolean;
var Qry : TZQuery;
begin
    try
    Result := True;
    Qry.Connection := ConexaoDB;
    Qry.SQL.Clear;
    Qry.SQL.Add(' UPDATE          clientes '+
                ' SET  nome         = :nome '+
                ' ,endereco         = :endereco '+
                ' ,cidade           = :cidade '+
                ' ,bairro           = :bairro ' +
                ' ,estado           = :estado '+
                ' ,cep              = :cep '+
                ' ,telefone         = :telefone '+
                ' ,email            = :email '+
                ' ,dataNascimento   = :dataNascimeto'+
                ' WHERE clienteId   = :clienteId');
    Qry.ParamByName('clienteId').AsInteger           := Self.F_clienteId;
    Qry.ParamByName('nome').AsString                 :=self.F_nome;
    Qry.ParamByName('endereco').AsString             := self.F_endereco;
    Qry.ParamByName('bairro').AsString               := self.F_bairro;
    Qry.ParamByName('estado').AsString               := self.F_estado;
    Qry.ParamByName('cep').AsString                  := self.F_cep;
    Qry.ParamByName('telefone').AsString             := self.F_telefone;
    Qry.ParamByName('email').AsString                := self.F_email;
    Qry.ParamByName('dataNascimento').AsDateTime     :=self.F_dataNascimento;
                 try
                    conexaoDB.StartTransaction;
                    Qry.ExecSQL;
                    conexaoDB.Commit;
                Except
                     conexaoDB.Rollback;
                     Result:= False;
                end;
    finally
        if Assigned(Qry) then
              FreeAndNil(Qry);
    end;
end;


function TCliente.Inserir: Boolean;
var Qry : TZQuery;
begin
     try
     Result := TRue;
     Qry := TZQuery.Create(nil);
     Qry.Connection := conexaoDB;
     Qry.SQL.Clear;
     Qry.SQL.Add(' INSERT INTO clientes(nome,'+
							  '	    endereco,'+
                              '	    cidade,' +
                              '	    bairro,' +
							  '	    estado,'    +
							  '	    cep,'        +
							  '	    telefone,'    +
							  '	    email,'        +
							  '     dataNascimento)' +
			'  VALUES               (:nome,'       +
							  '	    :endereco,'    +
							  '	    :cidade,'  +
							  '	    :bairro,'   +
							  '	    :estado,'    +
							  ' 	:cep,'       +
							  '     :telefone,'   +
							  '	    :email,' +
							  '	    :dataNascimento)');

    Qry.ParamByName('nome').AsString                 :=self.F_nome;
    Qry.ParamByName('endereco').AsString             := self.F_endereco;
    Qry.ParamByName('cidade').AsString               := self.F_cidade;
    Qry.ParamByName('bairro').AsString               := self.F_bairro;
    Qry.ParamByName('estado').AsString               := self.F_estado;
    Qry.ParamByName('cep').AsString                  := self.F_cep;
    Qry.ParamByName('telefone').AsString             := self.F_telefone;
    Qry.ParamByName('email').AsString                := self.F_email;
    Qry.ParamByName('dataNascimento').AsDateTime     :=self.F_dataNascimento;
                try
                    conexaoDB.StartTransaction;
                    Qry.ExecSQL;
                    conexaoDB.Commit;
                Except
                     conexaoDB.Rollback;
                     Result:= False;
                end;
   finally
        if Assigned(Qry) then
              FreeAndNil(Qry);
    end;
end;

function TCliente.Selecionar(id: Integer): Boolean;
 var Qry : TZQuery;
    begin
        try
            Result := TRue;
            Qry := TZQuery.Create(nil);
            Qry.Connection := conexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add(' SELECT clienteId,' +
                         '  nome,'             +
                         '  endereco,'         +
                         '  cidade,'           +
                         '  bairro,'           +
                         '  estado,'           +
                         '  cep,'              +
                         '  telefone,'         +
                         '  email,'            +
                         '  dataNascimento'    +
	                     '  FROM clientes'     +
                         '  WHERE clienteId = :clienteId');
            Qry.ParamByName('clienteId').AsInteger := id;
        try
           Qry.Open;
           Self.F_clienteId          :=Qry.FieldByName('clienteId').AsInteger;
           self.F_nome               :=Qry.FieldByName('nome').AsString;
           self.F_endereco           :=Qry.FieldByName('endereco').AsString;
           self.F_cidade             :=Qry.FieldByName('cidade').AsString;
           self.F_bairro             :=Qry.FieldByName('bairro').AsString;
           self.F_estado             :=Qry.FieldByName('estado').AsString;
           self.F_cep                :=Qry.FieldByName('cep').AsString;
           self.F_telefone           :=Qry.FieldByName('telefone').AsString;
           self.F_email              := Qry.FieldByName('email').AsString;
           self.F_dataNascimento     := Qry.FieldByName('dataNascimento').AsDateTime;
        Except
           Result := False;
        end;

        finally
          if assigned(Qry) then
            FreeAndNil(Qry);
        end;
    end;

{$endregion}

end.
