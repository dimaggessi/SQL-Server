USE EMPRESA_DB;

-- RELATÓRIO: 
-- LISTAR: NOME DO CLIENTE, ANO E MES DA COMPRA, QUANTIDADE DA COMPRA DO MÊS, SOMATÓRIO DO PREÇO E VALOR TOTAL
-- DEFINIR SE ATINGIU A META DE VENDAS PARA O CLIENTE 
-- OBJETIVO: ESTABELECER ESTRATÉGIAS DE MARKETING ESPECÍFICAS PARA DETERMINADO CLIENTE

SELECT C2.NomeCompleto,
	   C2.Cargo,
	   C2.ANO_MES,
	   C2.SOMATORIA_QUANTIDADE,
	   C2.SOMATORIA_PRECO,
	   C2.VALOR_TOTAL,
	   CASE
	       WHEN C2.VALOR_TOTAL >= 5000
		       THEN 'COMPLETA'
		   ELSE
		       'INCOMPLETA'
		END AS META_DE_VENDAS
FROM
	(SELECT CLI.NomeCompleto,
		   CLI.Cargo,
		   C1.ANO_MES,
		   C1.SOMATORIA_QUANTIDADE,
		   C1.SOMATORIA_PRECO,
		   C1.VALOR_TOTAL
	FROM
	(SELECT P.ClienteId, 
		   SUBSTRING(CONVERT(VARCHAR, P.DataPedido, 120), 1, 7) AS ANO_MES, 
		   SUM(D.Quantidade) SOMATORIA_QUANTIDADE, 
		   SUM(D.Preco) SOMATORIA_PRECO, 
		   SUM(D.Quantidade) * SUM(D.Preco) VALOR_TOTAL 
		   FROM TB_DETALHE_PEDIDO D
	JOIN TB_PEDIDO P ON D.NumeroPedido = P.NumeroPedido
	GROUP BY P.ClienteId, SUBSTRING(CONVERT(VARCHAR, P.DataPedido, 120), 1, 7)) AS C1
	JOIN TB_CLIENTE CLI ON C1.ClienteId = CLI.ClienteId) AS C2
	ORDER BY C2.NomeCompleto