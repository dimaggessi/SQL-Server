USE EMPRESA_DB;

-- RELATÓRIO DE FATURAMENTO DOS PRODUTOS NO ANO DE 1996

SELECT Q1.Categoria,
	   Q1.Ano,
	   CONVERT(DECIMAL(15,2), Q1.Faturamento) [Faturamento],
	   (Q1.Faturamento/Q2.Faturamento) * 100 [Percentual %]
FROM
(SELECT CA.Descricao [Categoria],
	   YEAR(PE.DataPedido) [Ano],
	   SUM(DE.Quantidade * DE.Preco) [Faturamento]
FROM TB_DETALHE_PEDIDO DE
	 JOIN TB_PRODUTO PR
		ON DE.ProdutoId = PR.ProdutoId
	 JOIN TB_CATEGORIA CA
		ON CA.CategoriaId = PR.CategoriaId
	 JOIN TB_PEDIDO PE
		ON PE.NumeroPedido = DE.NumeroPedido
	 WHERE YEAR(PE.DataPedido) = 1996
	 GROUP BY CA.Descricao, YEAR(PE.DataPedido)) AS Q1
INNER JOIN
(SELECT YEAR(PE.DataPedido) [Ano],
	   SUM(DE.Quantidade * DE.Preco) [Faturamento]
FROM TB_DETALHE_PEDIDO DE
	 JOIN TB_PRODUTO PR
		ON DE.ProdutoId = PR.ProdutoId
	 JOIN TB_CATEGORIA CA
		ON CA.CategoriaId = PR.CategoriaId
	 JOIN TB_PEDIDO PE
		ON PE.NumeroPedido = DE.NumeroPedido
	 WHERE YEAR(PE.DataPedido) = 1996
	 GROUP BY YEAR(PE.DataPedido)) AS Q2
ON Q1.Ano = Q2.Ano
ORDER BY Q1.Faturamento DESC;