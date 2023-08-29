USE EMPRESA_DB;

-- FETCH e OFFSET
-- possibilita dividir os resultados das consultas em páginas numeradas
-- a cláusula ORDER BY é necessária

-- OFFSET - quantas linhas quer pular
-- FETCH - quantas linhas capturar
SELECT * FROM TB_PEDIDO
ORDER BY NumeroPedido
OFFSET 40 ROWS FETCH NEXT 20 ROWS ONLY;

SELECT * FROM TB_PEDIDO
ORDER BY NumeroPedido;