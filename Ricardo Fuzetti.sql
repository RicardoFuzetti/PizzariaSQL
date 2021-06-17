DROP DATABASE IF EXISTS pizzaria;
CREATE DATABASE pizzaria;
USE pizzaria;

DROP TABLE IF EXISTS Cliente;
CREATE TABLE Cliente(
	CPF CHAR(11) PRIMARY KEY,
    nome VARCHAR(100),
    telefone CHAR(9)
);

INSERT INTO Cliente (CPF, nome, telefone) VALUES ('56165403215', 'Ricardo', 991234567);
INSERT INTO Cliente (CPF, nome, telefone) VALUES ('15035498165', 'João', 991239874);
INSERT INTO Cliente (CPF, nome, telefone) VALUES ('46548946511', 'Júlia', 995939851);
INSERT INTO Cliente (CPF, nome, telefone) VALUES ('20626540244', 'Roberto', 959730074);
INSERT INTO Cliente (CPF, nome, telefone) VALUES ('89105751304', 'Milena', 991266554);

DROP TABLE IF EXISTS Endereco;
CREATE TABLE Endereco(
	ID_Endereco INT PRIMARY KEY,
	CEP CHAR(8),
    rua VARCHAR(100),
    numero INT,
    bairro VARCHAR(50),
    complemento VARCHAR(100),
    cliente_CPF CHAR(11),
    FOREIGN KEY (cliente_CPF) REFERENCES Cliente(CPF)
);

INSERT INTO Endereco (ID_Endereco, CEP, rua, numero, bairro, complemento, cliente_CPF) VALUES (1, '82515000', 'Av Prefeito Erasto Gaertner', 2254, 'Bacacheri', 'BL:33 AP:34', 56165403215);
INSERT INTO Endereco (ID_Endereco, CEP, rua, numero, bairro, complemento, cliente_CPF) VALUES (2, '82600510', 'Rua Luiz Masssuquetto', 72, 'Bacacheri', 'Casa', 15035498165);
INSERT INTO Endereco (ID_Endereco, CEP, rua, numero, bairro, complemento, cliente_CPF) VALUES (3, '80030390', 'Rua Rocha Pombo', 5, 'Juvevê', 'Loja', 46548946511);
INSERT INTO Endereco (ID_Endereco, CEP, rua, numero, bairro, complemento, cliente_CPF) VALUES (4, '82515100', 'Rua Sargento Erwin', 2057, 'Bacacheri', 'Casa', 20626540244);
INSERT INTO Endereco (ID_Endereco, CEP, rua, numero, bairro, complemento, cliente_CPF) VALUES (5, '82710050', 'Rua do Cedro', 136, 'Barreirinha', 'Casa', 89105751304);

DROP TABLE IF EXISTS Atendente;
CREATE TABLE Atendente(
	ID_Atendente INT PRIMARY KEY,
    nome VARCHAR(100)
);

INSERT INTO Atendente (ID_Atendente, nome) VALUES(1, 'Ana Claudia');
INSERT INTO Atendente (ID_Atendente, nome) VALUES(2, 'Alcides Brek');

DROP TABLE IF EXISTS Entregador;
CREATE TABLE Entregador(
	ID_Entregador INT PRIMARY KEY,
    nome VARCHAR(100)
);

INSERT INTO Entregador (ID_Entregador, nome) VALUES(1, 'Roberto Amoedo');
INSERT INTO Entregador (ID_Entregador, nome) VALUES(2, 'Carlos Maia');

DROP TABLE IF EXISTS Pizzaiolo;
CREATE TABLE Pizzaiolo(
	ID_Pizzaiolo INT PRIMARY KEY,
    nome VARCHAR(100)
);

INSERT INTO Pizzaiolo (ID_Pizzaiolo, nome) VALUES(1, 'Fabrizio Ferrari');
INSERT INTO Pizzaiolo (ID_Pizzaiolo, nome) VALUES(2, 'Juan Matarazzo');

DROP TABLE IF EXISTS Pedido;
CREATE TABLE Pedido(
	ID_Pedido INT PRIMARY KEY,
    horario TIME,
    dia DATE,
    tempo_Producao TIME,
    tempo_Entrega TIME,
	ID_Pizzaiolo INT,
	ID_Entregador INT,
	ID_Atendente INT,
	ID_Endereco INT,
    cliente_CPF CHAR(11),
    FOREIGN KEY (ID_Pizzaiolo) REFERENCES Pizzaiolo(ID_Pizzaiolo),
    FOREIGN KEY (ID_Entregador) REFERENCES Entregador(ID_Entregador),
    FOREIGN KEY (ID_Atendente) REFERENCES Atendente(ID_Atendente),
    FOREIGN KEY (ID_Endereco) REFERENCES Endereco(ID_Endereco),
    FOREIGN KEY (cliente_CPF) REFERENCES Cliente(CPF)   
);

INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (1, '19:01', '2021-04-03', 20, 30, 1, 2, 1, 1, '56165403215');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (2, '19:45', '2021-04-03', 25, 25, 1, 2, 2, 2, '15035498165'); 
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (3, '20:05', '2021-04-03', 15, 20, 1, 2, 2, 3, '46548946511');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (4, '20:45', '2021-04-03', 20, 10, 2, 2, 2, 4, '20626540244');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (5, '21:00', '2021-04-03', 20, 15, 2, 1, 2, 5, '89105751304');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (6, '19:30', '2021-04-04', 10, 25, 2, 1, 2, 1, '56165403215');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (7, '19:45', '2021-04-04', 15, 20, 1, 1, 2, 2, '15035498165');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (8, '20:45', '2021-04-05', 10, 30, 1, 1, 1, 1, '56165403215');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (9, '21:45', '2021-04-05', 25, 20, 2, 2, 1, 2, '15035498165');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (10, '21:50', '2021-04-05', 15, 30, 1, 1, 1, 3, '46548946511');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (11, '19:05', '2021-04-06', 20, 20, 2, 2, 1, 2, '56165403215');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (12, '20:05', '2021-04-06', 15, 25, 2, 1, 1, 5, '89105751304');
INSERT INTO Pedido (ID_Pedido, horario, dia, tempo_Producao, tempo_Entrega,  ID_Pizzaiolo, ID_Entregador, ID_Atendente, ID_Endereco, cliente_CPF) VALUES (13, '20:00', '2021-04-07', 25, 25, 1, 2, 1, 1, '56165403215');

DROP TABLE IF EXISTS Tamanho;
CREATE TABLE Tamanho(
	ID_Tamanho INT PRIMARY KEY,
    tamanho VARCHAR(100)
);

INSERT INTO Tamanho (ID_Tamanho, tamanho) VALUES(1, 'Pequena');
INSERT INTO Tamanho (ID_Tamanho, tamanho) VALUES(2, 'Média');
INSERT INTO Tamanho (ID_Tamanho, tamanho) VALUES(3, 'Grande');

DROP TABLE IF EXISTS Sabor;
CREATE TABLE Sabor(
	ID_Sabor INT PRIMARY KEY,
    sabor VARCHAR(100)
);

INSERT INTO Sabor (ID_Sabor, sabor) VALUES(1, 'Quatro Queijos');
INSERT INTO Sabor (ID_Sabor, sabor) VALUES(2, 'Calabresa');
INSERT INTO Sabor (ID_Sabor, sabor) VALUES(3, 'Pepperoni');
INSERT INTO Sabor (ID_Sabor, sabor) VALUES(4, 'Marguerita');
INSERT INTO Sabor (ID_Sabor, sabor) VALUES(5, 'Frango Catupiry');

DROP TABLE IF EXISTS Ingrediente;
CREATE TABLE Ingrediente(
	ID_Ingrediente INT PRIMARY KEY,
    ingrediente VARCHAR(100)
);

INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(1, 'Molho de Tomate');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(2, 'Queijo Parmessão');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(3, 'Queijo Mussarela');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(4, 'Queijo Catupiry');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(5, 'Queijo Provolone');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(6, 'Calabresa');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(7, 'Pepperoni');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(8, 'Frango');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(9, 'Tomate');
INSERT INTO Ingrediente (ID_Ingrediente, ingrediente) VALUES(10, 'Manjericão');

DROP TABLE IF EXISTS Pizza;
CREATE TABLE Pizza(
	ID_Pizza INT PRIMARY KEY,
    preco DOUBLE,
    ID_Pedido INT,
    ID_Tamanho INT,
    ID_Sabor INT,
    FOREIGN KEY (ID_Pedido) REFERENCES Pedido(ID_Pedido),
    FOREIGN KEY (ID_Tamanho) REFERENCES Tamanho(ID_Tamanho),
    FOREIGN KEY (ID_Sabor) REFERENCES Sabor(ID_Sabor)
);

INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(1, 15.00, 1, 1, 1);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(2, 20.00, 1, 1, 2);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(3, 25.00, 1, 1, 3);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(4, 20.00, 2, 3, 4);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(5, 25.00, 3, 3, 1);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(6, 25.00, 4, 3, 3);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(7, 25.00, 5, 3, 4);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(8, 25.00, 6, 3, 1);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(9, 25.00, 6, 3, 4);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(10, 25.00, 7, 2, 3);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(11, 25.00, 7, 2, 2);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(12, 25.00, 8, 3, 1);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(13, 25.00, 9, 3, 5);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(14, 25.00, 10, 1, 1);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(15, 25.00, 10, 1, 3);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(16, 25.00, 11, 3, 4);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(17, 25.00, 12, 3, 4);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(18, 25.00, 13, 2, 2);
INSERT INTO Pizza (ID_Pizza, preco, ID_Pedido, ID_Tamanho, ID_Sabor) VALUES(19, 25.00, 13, 2, 1);

DROP TABLE IF EXISTS Pizza_Sabor;
CREATE TABLE Pizza_Sabor(
	ID_Pizza INT,
    ID_Sabor INT,
    PRIMARY KEY(ID_Pizza, ID_Sabor),
    FOREIGN KEY (ID_Pizza) REFERENCES Pizza(ID_Pizza),
    FOREIGN KEY (ID_Sabor) REFERENCES Sabor(ID_Sabor)
);

INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(1, 1);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(2, 2);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(3, 3);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(4, 4);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(5, 1);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(6, 5);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(7, 4);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(8, 1);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(9, 4);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(10, 3);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(11, 2);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(12, 1);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(13, 5);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(14, 1);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(15, 3);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(16, 4);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(17, 5);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(18, 2);
INSERT INTO Pizza_Sabor (ID_Pizza, ID_Sabor) VALUES(19, 1);

DROP TABLE IF EXISTS Sabor_Ingrediente;
CREATE TABLE Sabor_Ingrediente(
	ID_Sabor INT,
    ID_Ingrediente INT,
    PRIMARY KEY(ID_Sabor, ID_Ingrediente),
    FOREIGN KEY (ID_Ingrediente) REFERENCES Ingrediente(ID_Ingrediente),
    FOREIGN KEY (ID_Sabor) REFERENCES Sabor(ID_Sabor)
);

INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(1, 1);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(1, 3);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(1, 6);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(2, 1);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(2, 2);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(2, 3);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(2, 4);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(2, 5);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(3, 1);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(3, 2);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(3, 7);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(4, 1);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(4, 2);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(4, 9);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(4, 10);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(5, 1);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(5, 2);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(5, 4);
INSERT INTO Sabor_Ingrediente (ID_Sabor, ID_Ingrediente) VALUES(5, 8);

/* SABOR MAIS VENDIDO */
SELECT count(Pizza.ID_Sabor) as quantidade, Pizza.ID_Sabor, Sabor.sabor
FROM Pizza, Sabor
WHERE Sabor.ID_Sabor = Pizza.ID_Sabor
GROUP BY Pizza.ID_Sabor, Sabor.sabor
ORDER BY count(*) DESC;

/* SABOR MENOS VENDIDO */
SELECT count(Pizza.ID_Sabor) as quantidade, Pizza.ID_Sabor, Sabor.sabor
FROM Pizza, Sabor
WHERE Sabor.ID_Sabor = Pizza.ID_Sabor
GROUP BY Pizza.ID_Sabor, Sabor.sabor
ORDER BY count(*);

/* TAMANHO MAIS PEDIDO */
SELECT count(Pizza.ID_Tamanho) as quantidade, Pizza.ID_Tamanho, Tamanho.tamanho
FROM Pizza, Tamanho
WHERE Tamanho.ID_Tamanho = Pizza.ID_Tamanho
GROUP BY Pizza.ID_Tamanho, Tamanho.tamanho
ORDER BY count(*) DESC;

/* TAMANHO MENOS PEDIDO */
SELECT  count(Pizza.ID_Tamanho) as quantidade,Pizza.ID_Tamanho, Tamanho.tamanho
FROM Pizza, Tamanho
WHERE Tamanho.ID_Tamanho = Pizza.ID_Tamanho
GROUP BY Pizza.ID_Tamanho, Tamanho.tamanho
ORDER BY count(*);

/* DIA COM MAIS PEDIDOS */
SELECT count(Pedido.dia) as quantidade, Pedido.dia
FROM Pedido
GROUP BY Pedido.dia
ORDER BY count(*) DESC;

/* MÉDIA DE TEMPO DE ENTREGA */
SELECT round(avg(tempo_Entrega), 0) mediaEntrega 
FROM PEDIDO;

/* MÉDIA DE TEMPO DE PRODUÇÃO */
SELECT round(avg(tempo_Producao), 0) mediaProduçao 
FROM PEDIDO;

/* QUANTIDADE DE CLIENTES CADASTRADOS */
SELECT count(*)
FROM Cliente;

/* CLIENTE COM MAIS PEDIDOS REALIZADOS */
SELECT count(Pedido.cliente_CPF) as quantidade, Pedido.cliente_CPF, Cliente.nome
FROM Pedido, Cliente
WHERE Cliente.CPF = Pedido.cliente_CPF
GROUP BY Pedido.cliente_CPF, Cliente.nome
ORDER BY count(*) DESC;

/* BAIRRO COM MAIS CLIENTES*/
SELECT count(Endereco.bairro), Endereco.bairro
FROM Endereco, Cliente
WHERE Cliente.CPF = Endereco.cliente_CPF
GROUP BY Endereco.bairro
ORDER BY count(*) DESC;

/* BAIRRO COM MAIS PEDIDOS */
SELECT count(Pedido.ID_Endereco) as quantidade, Pedido.ID_Endereco, Endereco.bairro
FROM Pedido, Endereco
WHERE Endereco.ID_Endereco = Pedido.ID_Endereco
GROUP BY Endereco.bairro
ORDER BY count(*) DESC;

