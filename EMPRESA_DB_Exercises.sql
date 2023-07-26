USE EMPRESA_DB;

-- QUAL PRODUTO TEVE A MAIOR QUANTIDADE DE VENDAS NO MÊS 7 DE 1996

SELECT TOP (1) PROD.Descricao, SUM(D.Quantidade) AS Quantidade FROM TB_PRODUTO AS PROD
JOIN TB_DETALHE_PEDIDO D ON PROD.ProdutoId = D.ProdutoId
JOIN TB_PEDIDO P ON D.NumeroPedido = P.NumeroPedido
WHERE P.DataPedido BETWEEN '1996-07-01' AND '1996-07-31'
GROUP BY PROD.Descricao
ORDER BY SUM(D.Quantidade) DESC

-- QUAL CLIENTE TEVE O MAIOR GASTO NO MÊS 7 DE 1996
SELECT TOP (1) C.NomeCompleto, SUM(D.Preco) AS 'Total Gasto' FROM TB_PEDIDO AS P
JOIN TB_CLIENTE AS C ON P.ClienteId = C.ClienteId
JOIN TB_DETALHE_PEDIDO AS D ON D.NumeroPedido = P.NumeroPedido
WHERE P.DataPedido BETWEEN '1996-07-01' AND '1996-07-31'
GROUP BY C.NomeCompleto
ORDER BY SUM(D.Preco) DESC

-- LISTAR TODOS OS CLIENTES QUE MORAM NA ALEMANHA
SELECT C.NomeCompleto, E.Pais AS País FROM TB_CLIENTE AS C
JOIN TB_ENDERECO AS E ON C.ClienteId = E.ClienteId
WHERE E.Pais = 'Alemanha';

-- LISTAR TODOS OS CLIENTES QUE COMPRARAM PRODUTOS DA CATEGORIA BEBIDAS
SELECT C.NomeCompleto, CAT.Descricao FROM TB_CLIENTE AS C
JOIN TB_PEDIDO AS P ON C.ClienteId = P.ClienteId
JOIN TB_DETALHE_PEDIDO AS D ON P.NumeroPedido = D.NumeroPedido
JOIN TB_PRODUTO AS PROD ON D.ProdutoId = PROD.ProdutoId
JOIN TB_CATEGORIA AS CAT ON PROD.CategoriaId = CAT.CategoriaId
WHERE CAT.Descricao = 'Bebidas';
