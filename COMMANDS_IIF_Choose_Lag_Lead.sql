USE EMPRESA_DB;

-- IIF (<expressão booleana>, <valor_positivo>, <valor_negativo>)
-- parecido com um operador ternário

-- O comando IIF retorna um dos dois argumentos passados

SELECT IIF(2 = 2, 'TRUE', 'FALSE');

SELECT NomeCompleto,
	   IIF(Salario >= 5000, 'PADRÃO', 'FORA DO PADRÃO')
FROM DBO.TB_FUNCIONARIO


-- CHOOSE(<indice>, <valor_1>, <valor_2>, ... <valor_n>)
-- O comando CHOOSE age com um índice em uma lista de valores
-- O argumento índice determina qual dos valores seguintes será retornado

SELECT CHOOSE(3, 'FIRST', 'SECOND', 'THIRD', 'FOURTH', 'FIFTH');


-- LAG e LEAD ajudam a retornar informações para comparações

-- LAG (coluna, offset, vaçpr default)
-- permite recuperar um campo de N linhas anteriores à linha atual

SELECT NomeCompleto,
       Salario,
	   LAG(Salario, 1, 0) OVER(ORDER BY NomeCompleto) SALARIO_ANTERIOR
FROM TB_FUNCIONARIO

-- LEAD (coluna, offset, valor default)
-- permite recuperar um campo de N linhas posteriores à atual
SELECT NomeCompleto,
	   LAG(Salario, 1, 0) OVER(ORDER BY NomeCompleto) SALARIO_ANTERIOR,
	   Salario,
	   LEAD(Salario, 1, 0) OVER(ORDER BY NomeCompleto) SALARIO_POSTERIOR
FROM TB_FUNCIONARIO