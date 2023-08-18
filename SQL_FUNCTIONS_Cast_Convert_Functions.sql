USE EMPRESA_DB;

-- ADVANCED FUNCTIONS

-- CAST (PADRÃO DA LINGUAGEM SQL PARA CONVERSÃO DE DADOS)
SELECT GETDATE();
SELECT CAST(GETDATE() AS VARCHAR);

-- CONVERT (EXCLUSIVO DO SQL SERVER) CONVERT(TARGET_TYPE, EXPRESSION, DATE_STYLE SMALLINT)
SELECT CONVERT(VARCHAR, GETDATE(), 101);
SELECT CONVERT(VARCHAR, GETDATE(), 1);
SELECT CONVERT(VARCHAR, GETDATE(), 110);
SELECT CONVERT(VARCHAR, GETDATE(), 10);
SELECT CONVERT(VARCHAR, GETDATE(), 102); -- ANSI
SELECT CONVERT(VARCHAR, GETDATE(), 108);
SELECT CONVERT(VARCHAR, GETDATE(), 120); -- ODBC

SELECT CONVERT(DECIMAL(10, 2), '123123.321321');
SELECT CONVERT(BIGINT, '1231234321');
SELECT CONVERT(INT, '123432');

SELECT 'Produto ' + P.Descricao, D.Preco 
	FROM TB_PRODUTO P
	JOIN TB_DETALHE_PEDIDO D
		ON P.ProdutoId = D.ProdutoId;

SELECT CONCAT('Produto ', P.Descricao) AS [Nome], D.Preco 
	FROM TB_PRODUTO P
	JOIN TB_DETALHE_PEDIDO D
		ON P.ProdutoId = D.ProdutoId

SELECT CONCAT('Produto ', P.Descricao, ' - tem o preço de ') AS [Nome], D.Preco 
	FROM TB_PRODUTO P
	JOIN TB_DETALHE_PEDIDO D
		ON P.ProdutoId = D.ProdutoId

-- SELECT 'Produto ' + P.Descricao + ' tem o preço de ' +  D.Preco == ERROR
-- apresentaria erro pois Preço é um valor numérico, deveria ser convertido para varchar antes de concatenar!