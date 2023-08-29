USE EMPRESA_DB;

-- VIEWS
-- é uma tabela virtual formada por linhas e colunas de dados, os quais são provenientes de tabelas referenciadas
-- em uma query que define a view

-- a view é gerada de forma dinâmica no momento em que é chamada (não fica ativa o tempo todo)
-- depois de criada, não deixa de existir no sistema (reutilização)
-- não ocupam espaço no banco de dados
-- SEGURANÇA: as views permitem ocultar dados de uma tabela

-- 3 TIPOS DE VIEWS:
-- VIEWS STANDARD: são reunidos em uma tabela virtual, dados provenientes de uma ou mais views ou tabelas base.
-- VIEWS INDEXADAS: é obtida pela criação de um índice clusterizado sobre a view
-- VIEWS PARTICIONADAS: esse tipo de view permite que os dados em uma grande tabela sejam divididos em tabelas menores.

-- WITH ENCRYPTION: protege o código fonte da view, impedindo abertura a partir do object explorer
-- WITH SCHEMA BINDING: binding entre a view e as estruturas das tabelas referenciadas (as tabelas serão alteradas se alterar a view de forma compatível)
-- WITH CHECK OPTION: impede a inclusão e a alteração de dados através da view que sejam incompatíveis com a cláusula WHERE da instrução SELECT


-- WITH CHECK OPTIONS critérios definidos na cláusula WHERE sejam seguidos no momento da alteração de dados
CREATE TABLE TB_TESTE
(
    Nome VARCHAR(50) NULL,
	Telefone VARCHAR(30) NULL
);

INSERT INTO TB_TESTE
(Nome)
VALUES
('José'), ('Maria'), ('João');

CREATE VIEW VIEW_TESTE
WITH ENCRYPTION
AS 
SELECT Nome,
	   Telefone
	FROM 
		TB_TESTE
	WHERE Telefone IS NULL;

INSERT INTO VIEW_TESTE
	(Nome, Telefone)
	VALUES
	('Marcos', '12331243125');

SELECT * FROM VIEW_TESTE; -- na criaçã da view a cláusula WHERE define que é pra trazer somente o que está NULL
SELECT * FROM TB_TESTE;

-- ALTER VIEW (inserindo WITH CHECK OPTION)
ALTER VIEW VIEW_TESTE
WITH ENCRYPTION
AS 
SELECT Nome,
	   Telefone
	FROM 
		TB_TESTE
WHERE Telefone IS NULL
WITH CHECK OPTION;

-- INSERT COM FALHA (NÃO PERMITE INSERÇÃO OU ALTERAÇÃO CONTRÁRIA A CLÁUSULA WHERE - no caso, telefone deve ser NULL)
INSERT INTO VIEW_TESTE
    (Nome, Telefone)
	VALUES
	('Batista', '12331243125')

-- INSERT COM SUCESSO (TELEFONE IS NULL)
INSERT INTO VIEW_TESTE
    (Nome, Telefone)
	VALUES
	('João', NULL);


DROP VIEW VIEW_TESTE;