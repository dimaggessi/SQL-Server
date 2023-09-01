USE EMPRESA_DB;

-- TOTAL VENDIDO EM CADA UM DOS MESES FILTRADO POR UM DETERMINADO ANO
-- não usar SP_ para não confundir com as procedures do sistema (built-in)

CREATE PROCEDURE STP_TOTAL_VENDIDO @ANO AS INT
AS BEGIN
	SELECT MONTH(P.DataPedido) AS MES,
			YEAR(P.DataPedido) AS ANO,
			SUM(D.Preco) AS TOTAL_VENDIDO
		FROM TB_PEDIDO P 
		JOIN TB_DETALHE_PEDIDO D 
			ON P.NumeroPedido = D.NumeroPedido
		WHERE YEAR(P.DataPedido) = @ANO
		GROUP BY MONTH(P.DataPedido), YEAR(P.DataPedido)
		ORDER BY 1
END

-- executar a procedure
EXEC STP_TOTAL_VENDIDO 1998
EXEC STP_TOTAL_VENDIDO 1996

-- ITENS DO PEDIDO E DETALHES DO PEDIDO POR PERÍODO DE DATA E CLIENTE E/OU FUNCIONÁRIO
CREATE PROC STP_ITENS_PEDIDO	 @DT1 DATETIME2, 
								 @DT2 DATETIME2, 
								 @CLIENTE VARCHAR(50) = '%',
								 @FUNCIONARIO VARCHAR(50) = '%'
AS BEGIN
	SELECT P.NumeroPedido,
		   P.DataPedido,
		   D.Preco,
		   D.Desconto,
		   P.Frete,
		   C.NomeCompleto CLIENTE,
		   F.NomeCompleto FUNCIONARIO
		FROM TB_PEDIDO P
		JOIN TB_DETALHE_PEDIDO D
			ON P.NumeroPedido = D.NumeroPedido
		JOIN TB_CLIENTE C
			ON P.ClienteId = C.ClienteId
		JOIN TB_FUNCIONARIO F
			ON F.FuncionarioId = P.FuncionarioId
		WHERE P.DataPedido BETWEEN @DT1 AND @DT2 AND
			C.NomeCompleto LIKE @CLIENTE AND F.NomeCompleto LIKE @FUNCIONARIO
END

-- executando a procedure
EXEC STP_ITENS_PEDIDO '1997-01-01', '1997-12-31';
EXEC STP_ITENS_PEDIDO '1997-01-01', '1997-12-31', '%', '%';
EXEC STP_ITENS_PEDIDO '1997-01-01', '1997-12-31', 'Ernst Handel';
EXEC STP_ITENS_PEDIDO '1997-01-01', '1997-12-31', 'Ernst Handel', 'Margaret Peacock';
EXEC STP_ITENS_PEDIDO '1997-01-01', '1997-12-31', '%', 'Margaret Peacock';