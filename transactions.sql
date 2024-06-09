-- Transactions com COMMIT

-- Transaction 1
START TRANSACTION;
INSERT INTO livro (nome, preco, quantidade_estoque, quantidade_vendida, data) VALUES ('Livro A', 29.99, 50, 10, '2024-01-01');
INSERT INTO livro (nome, preco, quantidade_estoque, quantidade_vendida, data) VALUES ('Livro B', 39.99, 30, 5, '2024-02-01');
COMMIT;

-- Transaction 2
START TRANSACTION;
UPDATE MrPaper.livro SET
 preco = 35.99 
 WHERE livro.nome = 'Livro A';
UPDATE MrPaper.livro SET
quantidade_estoque = 40 
WHERE livro.nome = 'Livro B';
COMMIT;

-- Transaction 3
START TRANSACTION;
INSERT INTO `MrPaper`.`cliente` (`nome`, `login`, `senha`, `cpf`, `email`, `quantidade_compra`)
VALUES ('Cliente teste', 'clienteTeste', 'senha1',12345678901, 'clienteteste1@example.com', 2);
INSERT INTO cliente (nome, login, senha, cpf, email, quantidade_compra) 
VALUES ('Cliente teste2', 'clienteteste2', 'senha2', 12345678912, 'clienteteste2@example.com', 3);
COMMIT;

-- Transaction 4
START TRANSACTION;
DELETE FROM livro WHERE nome = 'Livro B';
DELETE FROM cliente WHERE nome = 'Cliente teste2';
COMMIT;

-- Transactions com ROLLBACK

-- Transaction 5
START TRANSACTION;
INSERT INTO avaliacao (estrelas, data, avaliador, livro_id_livro, cliente_id_cliente) VALUES (5, '2024-03-01', 'Cliente 1', 1, 1);
INSERT INTO avaliacao (estrelas, data, avaliador, livro_id_livro, cliente_id_cliente) VALUES (3, '2024-03-01', 'Cliente 2', 2, 2);
ROLLBACK;

-- Transaction 6
START TRANSACTION;
UPDATE livro SET quantidade_vendida = 15 WHERE nome = 'Livro A';
UPDATE cliente SET quantidade_compra = 5 WHERE nome = 'Cliente 1';
ROLLBACK;

-- Transaction 7
START TRANSACTION;
INSERT INTO editora (data, nome, exemplares_vendidos) VALUES ('2024-04-01', 'Editora A', 100);
INSERT INTO editora (data, nome, exemplares_vendidos) VALUES ('2024-04-01', 'Editora B', 150);
ROLLBACK;

-- Transaction 8
START TRANSACTION;
UPDATE editora SET exemplares_vendidos = 120 WHERE nome = 'Editora A';
UPDATE editora SET exemplares_vendidos = 170 WHERE nome = 'Editora B';
ROLLBACK;

-- Transactions com ROLLBACK TO SAVEPOINT

-- Transaction 9
START TRANSACTION;
SAVEPOINT sp1;
INSERT INTO categoria (nome, classificacao_indicativa) VALUES ('Ficção', 12);
SAVEPOINT sp2;
INSERT INTO categoria (nome, classificacao_indicativa) VALUES ('Não-Ficção', 10);
ROLLBACK TO sp1;
COMMIT;

-- Transaction 10
START TRANSACTION;
SAVEPOINT sp1;
UPDATE livro SET preco = 24.99 WHERE nome = 'Livro A';
SAVEPOINT sp2;
UPDATE livro SET quantidade_estoque = 60 WHERE nome = 'Livro A';
ROLLBACK TO sp2;
COMMIT;
