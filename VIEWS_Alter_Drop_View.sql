USE EMPRESA_DB;


-- ALTER VIEW - para retirar o schemabinding e assim poder alterar a TB_FUNCIONARIO e TB_PEDIDO

ALTER VIEW VIEW_PED2
WITH ENCRYPTION
AS SELECT F.NomeCompleto,
          P.NumeroPedido,
		  P.DataPedido,
		  F.TESTE
       FROM DBO.TB_FUNCIONARIO F
   JOIN DBO.TB_PEDIDO P
       ON F.FuncionarioId = P.FuncionarioId;

ALTER TABLE TB_FUNCIONARIO
DROP COLUMN TESTE;

-- Invalid column name 'TESTE'.
-- Could not use view or function 'VIEW_PED2' because of binding errors.
SELECT * FROM VIEW_PED2;

-- Em razão disso que é importante usar o schemabinding, pois alterações na Tabela podem quebrar a visualização da VIEW

-- DROP VIEW - APAGAR A VIEW
DROP VIEW VIEW_PED2;

-- Invalid object name 'VIEW_PED2'.
-- (a view foi apagada)
SELECT * FROM VIEW_PED2;