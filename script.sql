CREATE DATABASE loja;
USE loja;

CREATE TABLE Cliente (
idCliente INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(45),
email VARCHAR(45),
Rua VARCHAR(45),
Bairro VARCHAR(45),
CEP CHAR(8),
fkIndicador INT,
CONSTRAINT fki FOREIGN KEY (fkIndicador) REFERENCES Cliente(idCliente) 
);

INSERT INTO Cliente (nome, email,Rua, Bairro, CEP) VALUES
	('Isaac Souza', 'isaac.silvajr@gmail.com', 'Rua Otelo Augusto Ribeiro', 'Guainases', '08412000'),
    ('Diego Souza', 'dieguinhi@gmail.com', 'Rua bem me quer', 'São Mateus', '08391591'),
    ('Mateus Souza', 'mateussouza@gmail.com', 'Adelina Maria de Jesus', 'Jardim Apurá', '04470261');
    
UPDATE Cliente SET fkIndicado = 1 WHERE idCliente IN (2,3);

CREATE TABLE Produto (
idProduto INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR (45),
descricao VARCHAR (45),
preco DOUBLE
);

INSERT INTO Produto (nome, descricao, preco) VALUES
	('PS5', 'Vídeogame - Playstation 5', 3699.99),
    ('LGTV ', 'AIThing - 75 Polegadas', 3299.99),
    ('Moto G30', 'Motorola G30 - 256GB & 4RAM', 1399.99);

CREATE TABLE Venda (
idVenda INT,
fkCliente INT,
PRIMARY KEY (idVenda, fkCliente),
totalVenda DOUBLE,
dtVenda DATE,
CONSTRAINT fkCV FOREIGN KEY (fkCliente) REFERENCES Cliente(idCliente) 
);

INSERT INTO Venda VALUES
	(1,1, 3699.99, '2023-10-21'),
    (2,1, 3699.99, '2023-12-17'),
    (3,2, 1399.99, '2024-01-10'),
    (4,2, 3699.99, '2024-03-01'),
    (5,3, 3299.99, '2024-04-07'),
    (6,3, 2698.99, '2024-04-15');
    
select * from Venda;

CREATE TABLE NotaFiscal (
idNotaFiscal INT,
fkVenda INT,
fkProduto INT,
PRIMARY KEY (idNotaFiscal, fkVenda, fkProduto),
CONSTRAINT fkV FOREIGN KEY (fkVenda) REFERENCES Venda(idVenda), 
CONSTRAINT fkP FOREIGN KEY (fkProduto) REFERENCES Produto(idProduto),
quantidade INT,
valorDesconto DOUBLE 
);

INSERT INTO NotaFiscal VALUES
	(1,1,1,1, 25.5),
    (2,2,1,1, null),
    (3,3,3,1, 15.5),
    (4,4,1,1, null),
    (5,5,2,1, null),
    (6,6,3,2, 10.5);
    
SELECT * FROM Cliente;

SELECT * FROM Produto;

SELECT * FROM Venda;

SELECT * FROM NotaFiscal;

SELECT * FROM Cliente JOIN Venda ON idCliente = fkCliente;

SELECT * FROM Cliente JOIN Venda ON idCliente = fkCliente
	WHERE Cliente.nome = 'Diego Souza';
    
SELECT * FROM Cliente AS C JOIN Cliente AS I ON I.idCliente = C.fkIndicador;

SELECT * FROM Cliente AS C LEFT JOIN Cliente AS I ON I.idCliente = C.fkIndicador
	WHERE I.nome = 'Isaac Souza';
    
SELECT * FROM Cliente AS C JOIN Cliente AS I ON I.idCliente = C.fkIndicador JOIN Vendas ON idCliente = fkCliente JOIN Produtos
