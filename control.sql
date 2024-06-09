-- Criação do usuário user1
CREATE USER 'user1'@'localhost' IDENTIFIED BY 'password1';
GRANT SELECT, INSERT, UPDATE, DELETE ON MrPaper.* TO 'user1'@'localhost';

-- Criação do usuário user2
CREATE USER 'user2'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON MrPaper.* TO 'user2'@'localhost';

-- Criação do usuário user3
CREATE USER 'user3'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON MrPaper.* TO 'user3'@'localhost';

-- Criação do usuário user4
CREATE USER 'user4'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON MrPaper.* TO 'user4'@'localhost';

-- Criação do usuário user5
CREATE USER 'user5'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON MrPaper.* TO 'user5'@'localhost';

-- Criação do usuário user6
CREATE USER 'user6'@'localhost' IDENTIFIED BY 'password';
GRANT SELECT, INSERT, UPDATE, DELETE ON MrPaper.* TO 'user6'@'localhost';

-- Criação das roles

-- Criação da role Admin
CREATE ROLE 'Admin';
GRANT ALL PRIVILEGES ON *.* TO 'Admin' WITH GRANT OPTION;

-- Criação da role Manager
CREATE ROLE 'Manager';
GRANT ALL PRIVILEGES ON `MrPaper`.* TO 'Manager';

-- Criação da role Employee
CREATE ROLE 'Employee';
GRANT SELECT, INSERT, UPDATE, DELETE ON `MrPaper`.`livro` TO 'Employee';

-- Criação da role Client
CREATE ROLE 'Client';
GRANT SELECT ON `MrPaper`.`livro` TO 'Client';

-- Associação das roles aos users

-- Associação do papel Admin ao user1
GRANT 'Admin' TO 'user1'@'localhost';

-- Associação do papel Manager ao user2
GRANT 'Manager' TO 'user2'@'localhost';

-- Associação do papel Employee ao user3
GRANT 'Employee' TO 'user3'@'localhost';

-- Associação do papel Client ao user4
GRANT 'Client' TO 'user4'@'localhost';

-- Associação do papel Manager ao user5
GRANT 'Manager' TO 'user5'@'localhost';

-- Associação do papel Employee ao user6
GRANT 'Employee' TO 'user6'@'localhost';


-- TESTE DE USUÁRIOS

-- Selecionar dados
SELECT * FROM livro;

-- Inserir dados
INSERT INTO livro (nome, preco, quantidade_estoque, quantidade_vendida, data)
VALUES ('Teste Livro', 19.99, 100, 0, '2024-06-01');

-- Atualizar dados
UPDATE livro SET preco = 21.99 WHERE nome = 'Teste Livro';

-- Deletar dados
DELETE FROM livro WHERE nome = 'Teste Livro';

