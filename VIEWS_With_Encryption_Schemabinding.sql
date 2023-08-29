USE EMPRESA_DB;

-- VIEWS WITH ENCRYPTION - com criptografia para não mostrar o código de criação da view

CREATE VIEW VIEW_PED1 
WITH ENCRYPTION
AS
SELECT P.NumeroPedido, P.DataPedido, F.NomeCompleto
	FROM TB_PEDIDO P
JOIN TB_FUNCIONARIO F
	ON P.FuncionarioId = F.FuncionarioId;

-- A VIEW FUNCIONA BASICAMENTE COMO UMA TABELA
SELECT * FROM VIEW_PED1
WHERE NomeCompleto = 'Margaret Peacock';


-- WITH SCHEMABINDING - quando especificada essa cláusula, a view fica ligada a estrutura das tabelas que referencia
ALTER TABLE TB_FUNCIONARIO
ADD TESTE VARCHAR(50) NULL;

CREATE VIEW VIEW_PED2
WITH ENCRYPTION, SCHEMABINDING 
AS SELECT F.NomeCompleto,
          P.NumeroPedido,
		  P.DataPedido,
		  F.TESTE
       FROM DBO.TB_FUNCIONARIO F
   JOIN DBO.TB_PEDIDO P
       ON F.FuncionarioId = P.FuncionarioId;

SELECT * FROM DBO.VIEW_PED2;

-- QUALQUER ALTERAÇÃO NA TABELA FUNCIONÁRIOS NÃO PODERÁ SER FEITA - pois implicará em alteração na VIEW
-- "ALTER TABLE DROP COLUMN TESTE failed because one or more objects access this column."
ALTER TABLE DBO.TB_FUNCIONARIO
DROP COLUMN TESTE;
