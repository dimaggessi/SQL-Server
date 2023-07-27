USE EMPRESA_DB;

-- QUAIS CARGOS POSSUEM MÉDIA SALARIAL MAIOR QUE A MÉDIA SALARIAL DO CARGO DE 'Coordenador de Vendas Internas'
SELECT F1.Cargo, AVG(F1.Salario) [Média Salarial] FROM TB_FUNCIONARIO AS F1
GROUP BY F1.Cargo
HAVING AVG(F1.Salario) > (SELECT AVG(F2.Salario) FROM TB_FUNCIONARIO AS F2 WHERE F2.Cargo = 'Coordenador de Vendas Internas');

-- QUAL PRODUTO TEVE MAIS VENDAS EM 07 DE 1996

-- USANDO JOIN
SELECT TOP (1) P2.Descricao, D.Quantidade FROM TB_DETALHE_PEDIDO AS D
JOIN TB_PEDIDO AS P1 ON P1.NumeroPedido = D.NumeroPedido
JOIN TB_PRODUTO AS P2 ON D.ProdutoId = P2.ProdutoId
WHERE P1.DataPedido BETWEEN '1996-07-01' AND '1996-07-31' ORDER BY D.Quantidade DESC;

-- USANDO SUBQUERY
SELECT
	C1.Descricao,
	C1.Quantidade
	FROM
	(
		SELECT TOP (1) P1.Descricao, SUM(D.Quantidade)[Quantidade]  FROM TB_PRODUTO AS P1
		JOIN TB_DETALHE_PEDIDO AS D ON P1.ProdutoId = D.ProdutoId
		WHERE D.NumeroPedido IN (SELECT P2.NumeroPedido FROM TB_PEDIDO AS P2 WHERE P2.DataPedido BETWEEN '1996-07-01' AND '1996-07-31')
		GROUP BY P1.Descricao
		ORDER BY SUM(D.Quantidade) DESC
	) AS C1;

-- QUAL VENDEDOR TEVE O MAIOR VALOR NO TOTAL DE SUAS VENDAS
SELECT C1.NomeCompleto, C1.Total FROM
(
	SELECT TOP (1) C2.NomeCompleto, SUM(D.Preco)[Total] FROM TB_DETALHE_PEDIDO D
	JOIN(SELECT PE.NumeroPedido, F.NomeCompleto FROM TB_PEDIDO PE
		 JOIN TB_FUNCIONARIO F ON PE.FuncionarioId = F.FuncionarioId
		 WHERE F.Cargo = 'Representante de Vendas') AS C2
		 ON C2.NumeroPedido = D.NumeroPedido
		 GROUP BY C2.NomeCompleto
		 ORDER BY Total DESC
) AS C1;
