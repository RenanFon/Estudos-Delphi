object dtmPrincipal: TdtmPrincipal
  OldCreateOrder = False
  Height = 455
  Width = 855
  object conexaoDB: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'controls_cp=CP_UTF16')
    Connected = True
    SQLHourGlass = True
    HostName = 'localhost'
    Port = 3306
    Database = 'vendas'
    User = 'root'
    Password = ''
    Protocol = 'mysql'
    LibraryLocation = 'C:\Users\Bsoft\Desktop\CursoDElphi\CursoRevisado\libmysql.dll'
    Left = 184
    Top = 40
  end
  object qryScriptCategoria: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS categorias('
      #9'categoriaID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,'
      #9'descricao VARCHAR(30)'
      ');')
    Params = <>
    Properties.Strings = (
      'CREATE TABLE IF NOT EXISTS categorias('
      #9'categoriaID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,'
      #9'descricao VARCHAR(30)'
      ');')
    Left = 384
    Top = 32
  end
  object qryScriptClientes: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS clientes('
      #9'clienteId INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,'
      #9'nome VARCHAR(60)NOT NULL,'
      #9'endereco VARCHAR(60) NOT NULL,'
      #9'cidade VARCHAR(50) NOT NULL,'
      #9'bairro VARCHAR(40) NOT NULL,'
      #9'estado VARCHAR(2) NOT NULL,'
      #9'cep VARCHAR(10) NOT NULL,'
      #9'telefone VARCHAR(14) NOT NULL,'
      #9'email VARCHAR(100) NOT NULL,'
      #9'dataNascimento DATETIME NOT NULL'
      ');')
    Params = <>
    Left = 544
    Top = 32
  end
  object qryScriptCategoriaProdutos: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS produtos('
      #9'produtoId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,'
      #9'nome VARCHAR(60) NOT NULL,'
      #9'descricao VARCHAR(255) NOT NULL,'
      #9'valor DECIMAL(18,5)DEFAULT 0.00000 NOT NULL,'
      #9'quantidade DECIMAL(18,5) DEFAULT 0.00000 NOT NULL,'
      #9'categoriaId INT NOT NULL, '
      #9'CONSTRAINT FK_ProdutosCategorias'
      #9'FOREIGN KEY (categoriaId) REFERENCES categorias(categoriaID) '
      ');'
      '')
    Params = <>
    Left = 656
    Top = 40
  end
  object qryScriptVendas: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS vendas('
      #9#9#9#9#9#9'vendaId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,'
      #9#9#9#9#9#9'clienteId INT NOT NULL,'
      #9#9#9#9#9#9'datavenda DATETIME DEFAULT CURDATE(),'
      #9#9#9#9#9#9'totalVenda DECIMAL(18,5) DEFAULT 0.00000,'
      #9#9#9#9#9#9'CONSTRAINT FK_VendasCliente FOREIGN KEY (clienteid)'
      #9#9#9#9#9#9'REFERENCES clientes(clienteId)'
      #9#9#9#9#9#9');'#9)
    Params = <>
    Left = 448
    Top = 120
  end
  object qryScriptItensVendas: TZQuery
    Connection = conexaoDB
    SQL.Strings = (
      'CREATE TABLE IF NOT EXISTS vendasItens('
      #9#9'vendaId INT PRIMARY KEY NOT NULL,'
      #9#9'produtoId INT NOT NULL,'
      #9#9'valorUnitario DECIMAL(18,5) DEFAULT 0.00000,'
      #9#9'quantidade DECIMAL(18,5) DEFAULT 0.00000,'
      #9#9'totalProduto DECIMAL (18,5) DEFAULT 0.00000,'
      #9#9'CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)'
      #9#9'REFERENCES produtos(produtoId)'
      #9#9#9#9#9#9#9#9#9');'#9)
    Params = <>
    Left = 576
    Top = 144
  end
end
