unit cAtualizacaoTabelaMSSQL;

interface

uses System.Classes,
     Vcl.Controls,
     Vcl.ExtCtrls,
     Vcl.Dialogs,
     ZAbstractConnection,
     ZConnection,
     ZAbstractRODataset,
     ZAbstractDataset,
     ZDataset,
     System.SysUtils,
     cAtualizacaoBancoDeDados,
     cUsuario;

     type
  TAtualizacaoTableMSSQL = class(TAtualizaBancoDados)

  private
    function  TabelaExiste(aNomeTabela:String):Boolean;

  protected

  public
    constructor Create(aConexao:TZConnection);
    destructor Destroy; override;

    procedure Categoria;
    procedure Cliente;
    procedure Produto;
    procedure Vendas;
    procedure VendasItens;
    procedure Usuario;
    procedure AcaoAcesso;
    procedure UsuariosAcaoAcesso;
end;

implementation

{ TAtualizacaoTableMSSQL }


constructor TAtualizacaoTableMSSQL.Create(aConexao: TZConnection);
begin
    ConexaoDB := aConexao;
end;

destructor TAtualizacaoTableMSSQL.Destroy;
begin

  inherited;
end;

procedure TAtualizacaoTableMSSQL.AcaoAcesso;
begin
  if not TabelaExiste('acaoAcesso') then
  begin
    ExecutaDiretoBancoDeDados(
      	'CREATE TABLE acaoAcesso(     '+
        'acaoAcessoId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  '+
        'descricao VARCHAR(100) NOT NULL,  '+
        'chave VARCHAR(60) NOT NULL    '+
		')'
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Categoria;
begin
  if not TabelaExiste('categorias') then
  begin
    ExecutaDiretoBancoDeDados(
      'CREATE TABLE IF NOT EXISTS categorias( '+
      '	 categoriaId NTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT, '+
      '	 descricao  VARCHAR(30) NOT NULL,'+
      '	) '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Cliente;
begin
  if not TabelaExiste('clientes') then
  begin
    ExecutaDiretoBancoDeDados(
       '     CREATE TABLE IF NOT EXISTS clientes(  '+
       '    clienteId INT PRIMARY KEY NOT NULL AUTO_INCREMENT, '+
       '     nome VARCHAR(60)NOT NULL,           '+
       '     endereco VARCHAR(60) NOT NULL,      '+
       '     cidade VARCHAR(50) NOT NULL,        '+
       '     bairro VARCHAR(40) NOT NULL,        '+
       '     estado VARCHAR(2) NOT NULL,         '+
       '     cep VARCHAR(10) NOT NULL,           '+
       '     telefone VARCHAR(14) NOT NULL,      '+
       '     email VARCHAR(100) NOT NULL,        '+
       '     dataNascimento DATETIME NOT NULL    '+
       ') ' );
  end;
end;


procedure TAtualizacaoTableMSSQL.Produto;
 begin
  if not TabelaExiste('produtos') then
  begin
    ExecutaDiretoBancoDeDados(
       '    produtoId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,  '+
       '         CREATE TABLE IF NOT EXISTS produtos(            '+
       '    nome VARCHAR(60) NOT NULL,                           ' +
       '     descricao VARCHAR(255) NOT NULL,                    ' +
       '     valor DECIMAL(18,5)DEFAULT 0.00000 NOT NULL,        '  +
       '    quantidade DECIMAL(18,5) DEFAULT 0.00000 NOT NULL,     ' +
       '     categoriaId INT NOT NULL,                            '   +
       '     CONSTRAINT FK_ProdutosCategorias                       '  +
       '     FOREIGN KEY (categoriaId) REFERENCES categorias(categoriaID)  ' +
       ' )');
  end;
end;


function TAtualizacaoTableMSSQL.TabelaExiste(aNomeTabela: String): Boolean;
Var Qry:TZQuery;
    begin
          Try
            Result:=False;
            Qry:=TZQuery.Create(nil);
            Qry.Connection:=ConexaoDB;
            Qry.SQL.Clear;
            Qry.SQL.Add(' SELECT OBJECT_ID (:NomeTabela) As ID ');
            Qry.ParamByName('NomeTabela').AsString:=aNomeTabela;
            Qry.Open;

            if Qry.FieldByName('ID').AsInteger>0 then
               Result:=True;

          Finally
            Qry.Close;
            if Assigned(Qry) then
               FreeAndNil(Qry);
          End;
    end;

procedure TAtualizacaoTableMSSQL.Usuario;
Var oUsuario:TUsuario;
begin
  if not TabelaExiste('usuarios') then
  begin
    ExecutaDiretoBancoDeDados(
  '   CREATE TABLE IF NOT EXISTS usuarios(                '+
  '   usuarioId INT NOT NULL PRIMARY KEY AUTO_INCREMENT,   '+
  '   nome VARCHAR(50) NOT NULL,                            '+
  '   senha VARCHAR(40) NOT NULL                            '+
      ' )'
    );
  end;

  Try
    oUsuario:=TUsuario.Create(ConexaoDB);
    oUsuario.nome:='ADMIN';
    oUsuario.senha:='mudar@123';
    if not oUsuario.UsuarioExiste(oUsuario.nome) then
      oUsuario.Inserir;
  Finally
    if Assigned(oUsuario) then
       FreeAndNil(oUsuario);
  End;

end;

procedure TAtualizacaoTableMSSQL.UsuariosAcaoAcesso;
    begin
  if not TabelaExiste('usuariosAcaoAcesso') then
  begin
      ExecutaDiretoBancoDeDados(
       '  CREATE TABLE usuariosAcaoAcesso(  '+
       '  usuarioId  int NOT NULL ,          '+
       '  acaoAcessoId int NOT NULL,          '+
       '  ativo bit not null default 1,        '+
       '  PRIMARY KEY (usuarioId, acaoAcessoId), '+
       '  CONSTRAINT FK_UsuarioAcaoAcessoUsuario    '+
       '  FOREIGN KEY (usuarioId) references usuarios(usuarioId),   '+
       '  CONSTRAINT FK_UsuarioAcaoAcessoAcaoAcesso    '+
       '  FOREIGN KEY (acaoAcessoId) references acaoAcesso(acaoAcessoId) '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.Vendas;
begin
  if not TabelaExiste('vendas') then
  begin
    ExecutaDiretoBancoDeDados(
                     '   CREATE TABLE vendas(      '+
					 '	vendaId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,    '+
					 '	clienteId INT NOT NULL,      '+
					 '	datavenda DATETIME DEFAULT CURDATE(),       '+
					 '	totalVenda DECIMAL(18,5) DEFAULT 0.00000,    '+
					 '	CONSTRAINT FK_VendasCliente FOREIGN KEY (clienteid)     '+
					 '	REFERENCES clientes(clienteId)    '
    );
  end;
end;

procedure TAtualizacaoTableMSSQL.VendasItens;
begin
  if not TabelaExiste('vendasItens') then
  begin
        ExecutaDiretoBancoDeDados(
    '    CREATE TABLE IF NOT EXISTS vendasItens(     '+
    '    vendaId INT PRIMARY KEY AUTO_INCREMENT NOT NULL,  '+
    '    produtoId INT NOT NULL,     '+
    '    valorUnitario DECIMAL(18,5) DEFAULT 0.00000,      '+
    '    quantidade DECIMAL(18,5) DEFAULT 0.00000,    '+
    '    totalProduto DECIMAL (18,5) DEFAULT 0.00000,    '+
    '    CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)  '+
    '    REFERENCES produtos(produtoId) '+
    ')' );
  end;
end;

end.
