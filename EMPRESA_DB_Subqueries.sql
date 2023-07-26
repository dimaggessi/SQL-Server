USE EMPRESA_DB;

-- SUBQUERIES

-- DESCRIÇÃO DOS PRODUTOS QUE POSSUEM O PREÇO MAIOR QUE A MÉDIA DE TODOS OS PRODUTOS
SELECT P.Descricao FROM TB_PRODUTO AS P
WHERE P.Preco > (SELECT AVG(P2.Preco) FROM TB_PRODUTO AS P2)

-- TODOS OS CLIENTES QUE EXISTAM PEDIDOS NO MÊS 7 DE 1996
SELECT C.* FROM TB_CLIENTE AS C
WHERE EXISTS (SELECT * FROM TB_PEDIDO AS P 
				WHERE C.ClienteId = P.ClienteId AND
				P.DataPedido BETWEEN '1996-07-01' AND '1996-07-31');

-- UM CLIENTE ESPECÍFICO QUE TENHA PEDIDOS NO MÊS 7 DE 1996
SELECT C.* FROM TB_CLIENTE AS C
WHERE EXISTS (SELECT * FROM TB_PEDIDO AS P 
				WHERE C.ClienteId = P.ClienteId AND
				P.DataPedido BETWEEN '1996-07-01' AND '1996-07-31')
	  AND C.ClienteId = 'CHOPS';

-- O NOME E O TOTAL DE PEDIDOS DE CADA CLIENTE
SELECT C.NomeCompleto,
	   (SELECT COUNT(*) FROM TB_PEDIDO AS P WHERE P.ClienteId = C.ClienteId) [Total Pedidos]
FROM TB_CLIENTE AS C
ORDER BY [Total Pedidos] DESC

