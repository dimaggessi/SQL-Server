
-- VARIAVEIS
-- @ identifica para o SQL Server que é uma variável

DECLARE @NUM1 INT = 10;

DECLARE @NUM2 INT = 20, @NUM3 INT = 30;

PRINT @NUM1 + @NUM2 * @NUM3;

-- ao executar, é necessário selecionar além do PRINT as variáveis em DECLARE
-- para que o SQL Server entenda aonde está a definição de @NUM1, @NUM2 e @NUM3

-- caso selecione apenas a instrução PRINT um erro será exibido:
-- Must declare the scalar variable "@NUM1".

DECLARE @NUM1 INT = 50, @NUM2 INT = 51, @RESULT INT;

SET @RESULT = @NUM1 + @NUM2; 
-- PODE SER USADO TAMBÉM 'SELECT', terá a mesma função do SET

PRINT @RESULT;

-- OPERADORES RELACIONAIS
/*
    = Igual a
	> Maior que
	< Menor que
	>= Maior ou igual
	<= Menor ou igual
	<> Diferente de
*/

-- OPERADORES LÓGICOS
/*
    ALL - retorna true se todo um conjunto de comparações for TRUE
	AND 
	ANY - retorna true se houver alguma comparação que retorne TRUE
	BETWEEN - retorna true se dentro de uma faixa de valores
	EXISTS - retorna true se uma subquery possuir quaisquer linhas
	IN - retorna true se um operando for igual a outro dentro de uma lista de expressões
	LIKE - retorna true se um operando atender a uma condição
	NOT
	OR
	SOME - retorna true se alguma comparação de um conjunto de comparações for TRUE
	       é parecido com o ANY, mas leva em conta o conjunto de comparações
*/



