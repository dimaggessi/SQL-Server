USE EMPRESA_DB;

-- PIVOT e UNPIVOT

-- resultado normal agrupado pelo numero de pedido e pelo mês, mostrando o total de frete de cada pedido
SELECT NumeroPedido,
       MONTH(DataPedido) AS MES,
	   SUM(Frete) AS TOTAL_FRETE
	FROM TB_PEDIDO
	WHERE YEAR(DataPedido) = 1998
	GROUP BY NumeroPedido, MONTH(DataPedido), YEAR(DataPedido)
	ORDER BY 1, 2, 3

-- PIVOT -> vai transformar as linhas, que são os meses, em colunas
SELECT NumeroPedido, ISNULL([1], 0) AS 'MÊS 1', ISNULL([2], 0) AS 'MÊS 2', ISNULL([3], 0) AS 'MÊS 3',
       ISNULL([4], 0) AS 'MÊS 4', ISNULL([5], 0) AS 'MÊS 5', ISNULL([6], 0) AS 'MÊS 6',
	   ISNULL([7], 0) AS 'MÊS 7', ISNULL([8], 0) AS 'MÊS 8', ISNULL([9], 0) AS 'MÊS 9',
	   ISNULL([10], 0) AS 'MÊS 10', ISNULL([11], 0) AS 'MÊS 11', ISNULL([12], 0) AS 'MÊS 12'
	FROM (SELECT NumeroPedido,
		  MONTH(DataPedido) AS MES,
	      SUM(Frete) AS TOTAL_FRETE
	    FROM TB_PEDIDO
	    WHERE YEAR(DataPedido) = 1998
		GROUP BY NumeroPedido, MONTH(DataPedido), YEAR(DataPedido)) P
	PIVOT ( SUM(P.TOTAL_FRETE) FOR P.MES IN([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]) ) AS PVT
	ORDER BY 1
-- soma o TOTAL_FRETE para cada mês


-- UNPIVOT
-- faz o contrário, transforma colunas em linhas

CREATE TABLE TB_UNPIVOT
(
    NumeroPedido INT NULL,
	MES1 INT NULL,
	MES2 INT NULL,
	MES3 INT NULL,
	MES4 INT NULL,
	MES5 INT NULL,
	MES6 INT NULL,
	MES7 INT NULL,
	MES8 INT NULL,
	MES9 INT NULL,
	MES10 INT NULL,
	MES11 INT NULL,
	MES12 INT NULL
);

INSERT INTO TB_UNPIVOT
SELECT NumeroPedido, ISNULL([1], 0) AS 'MÊS 1', ISNULL([2], 0) AS 'MÊS 2', ISNULL([3], 0) AS 'MÊS 3',
       ISNULL([4], 0) AS 'MÊS 4', ISNULL([5], 0) AS 'MÊS 5', ISNULL([6], 0) AS 'MÊS 6',
	   ISNULL([7], 0) AS 'MÊS 7', ISNULL([8], 0) AS 'MÊS 8', ISNULL([9], 0) AS 'MÊS 9',
	   ISNULL([10], 0) AS 'MÊS 10', ISNULL([11], 0) AS 'MÊS 11', ISNULL([12], 0) AS 'MÊS 12'
	FROM (SELECT NumeroPedido,
		  MONTH(DataPedido) AS MES,
	      SUM(Frete) AS TOTAL_FRETE
	    FROM TB_PEDIDO
	    WHERE YEAR(DataPedido) = 1998
		GROUP BY NumeroPedido, MONTH(DataPedido), YEAR(DataPedido)) P
	PIVOT ( SUM(P.TOTAL_FRETE) FOR P.MES IN([1], [2], [3], [4], [5], [6], [7], [8], [9], [10], [11], [12]) ) AS PVT
	ORDER BY 1

SELECT NumeroPedido, MES, TOTAL_VENDAS
    FROM 
    (SELECT NumeroPedido, MES1, MES2, MES3, MES4, MES5,
	    MES6, MES7, MES8, MES9, MES10, MES11, MES12
	FROM TB_UNPIVOT) P
	UNPIVOT(TOTAL_VENDAS FOR MES IN(MES1, MES2, MES3, MES4, MES5,
	    MES6, MES7, MES8, MES9, MES10, MES11, MES12)) AS UP
	 