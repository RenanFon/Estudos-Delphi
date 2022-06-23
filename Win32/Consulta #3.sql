USE delphidb;


CREATE TABLE tabela(
	id INTEGER NOT NULL PRIMARY KEY,
	nome VARCHAR(255) NOT NULL

);


ALTER TABLE tabela ADD flagativo BIT;


ALTER TABLE tabela DROP COLUMN flagativo;

SELECT * FROM tabela;

DROP TABLE tabela;

CREATE DATABASE vendas;

USE vendas ;

DROP TABLE categorias;

CREATE TABLE IF NOT EXISTS categorias(
	categoriaID INTEGER NOT NULL PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(30)
);


INSERT INTO categorias(descricao)VALUES
('Alimentacao'),
('BAzar'),
('Brinquedo');

SELECT * FROM categorias;

SELECT categoriaID,descricao FROM categorias;

SELECT descricao, categoriaID FROM categorias WHERE categoriaID = 3;


SELECT categoriaID FROM categorias WHERE categoriaID = 3;

SELECT categoriaID FROM categorias WHERE descricao LIKE 'B%';




UPDATE categorias SET descricao = 'fastfood' WHERE categoriaID = 5;




DELETE FROM categorias WHERE categoriaID = 3;

INSERT INTO categorias(descricao) VALUES ('Bife do Pantano ');


SELECT categoriaID,descricao
                         FROM categorias
                         WHERE categoriaID = categoriaID;
                         
                         
                         
                         

CREATE TABLE IF NOT EXISTS clientes(
	clienteId INT PRIMARY KEY NOT NULL UNIQUE AUTO_INCREMENT,
	nome VARCHAR(60)NOT NULL,
	endereco VARCHAR(60) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	bairro VARCHAR(40) NOT NULL,
	estado VARCHAR(2) NOT NULL,
	cep VARCHAR(10) NOT NULL,
	telefone VARCHAR(14) NOT NULL,
	email VARCHAR(100) NOT NULL,
	dataNascimento DATETIME NOT NULL 
);

DROP TABLE clientes;

SELECT 
		clienteId,
		nome,
		endereco,
		cidade,
		bairro,
		estado,
		cep,
		telefone,
		email,
		dataNascimento
	FROM clientes;
	
	INSERT INTO clientes(nome,
								endereco,
								cidade,
								bairro,
								estado,
								cep,
								telefone,
								email,
								dataNascimento)
			  VALUES       (nome,
								endereco,
								cidade,
								bairro,
								estado,
								cep,
								telefone,
								email,
								dataNascimento);

	DELETE FROM clientes WHERE clienteId = 1;	

SELECT clienteId,
                          nome,
                        endereco,         
                          cidade,           
                          bairro,           
                          estado,           
                          cep,              
                          telefone,         
                          email,            
                          dataNascimento    
	                      FROM clientes     
                          WHERE clienteId = clienteId;
                          
                          
CREATE TABLE IF NOT EXISTS produtos(
	produtoId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
	nome VARCHAR(60) NOT NULL,
	descricao VARCHAR(255) NOT NULL,
	valor DECIMAL(18,5)DEFAULT 0.00000 NOT NULL,
	quantidade DECIMAL(18,5) DEFAULT 0.00000 NOT NULL,
	categoriaId INT NOT NULL, 
	CONSTRAINT FK_ProdutosCategorias
	FOREIGN KEY (categoriaId) REFERENCES categorias(categoriaID) 
);

SELECT * FROM produtos;

INSERT INTO produtos (nome,
							descricao,
							valor,
							quantidade,
							categoriaId)
				VALUES   (
							:nome
							:descricao
							:valor
							:quantidade
							:categoria	
				);
				
SELECT produtoId,
		 nome,
		 descricao,
		 valor,
		 quantidade,
		 categoriaId FROM produtos WHERE produtoId = produtoId;
		 
		 
DROP TABLE vendas;	
	 
CREATE TABLE IF NOT EXISTS vendas(
						vendaId INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
						clienteId INT NOT NULL,
						datavenda DATETIME DEFAULT CURDATE(),
						totalVenda DECIMAL(18,5) DEFAULT 0.00000,
						CONSTRAINT FK_VendasCliente FOREIGN KEY (clienteid)
						REFERENCES clientes(clienteId)
						);		 
DROP TABLE vendasitens;

SELECT * FROM vendasitens;
		 	 
CREATE TABLE IF NOT EXISTS vendasItens(
		vendaId INT PRIMARY KEY NOT NULL,
		produtoId INT NOT NULL,
		valorUnitario DECIMAL(18,5) DEFAULT 0.00000,
		quantidade DECIMAL(18,5) DEFAULT 0.00000,
		totalProduto DECIMAL (18,5) DEFAULT 0.00000,
		CONSTRAINT FK_VendasItensProdutos FOREIGN KEY (produtoId)
		REFERENCES produtos(produtoId)
									);		 	 
		 
		 
 SELECT clienteId,nome FROM clientes ;	
 
 SELECT produtoId, nome,valor, quantidade FROM produtos;	 


SELECT vendas.vendaId,vendas.clienteId,clientes.nome,vendas.datavenda,vendas.totalVenda
		FROM vendas INNER JOIN clientes ON clientes.clienteId = vendas.clienteId;		 
		 
		 
		 
		 
		 
SELECT * FROM vendas;	