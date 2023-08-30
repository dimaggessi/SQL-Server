
-- LAÇO DE REPETIÇÃO - WHILE
-- enquanto a condição for verdadeira, repete..

DECLARE @NUM INT = 10;

WHILE (@NUM >= 0)
BEGIN
    IF @NUM = 5
	BEGIN
	    PRINT 'IGUAL A 5, CONTINUE'
		SET @NUM -= 1;
		CONTINUE --> continua o loop e não executa o PRINT
		PRINT 'NÃO EXECUTA O CÓDIGO'
	END

	PRINT @NUM;

	SET @NUM -= 1;

	IF @NUM = 2
	BEGIN
	    PRINT 'IGUAL A 2, BREAK'
		BREAK
	END
END

-- TABUADA DE 1 A 10
-- usando WHILE
DECLARE @T INT = 1, @N INT;
WHILE @T <= 10
BEGIN
    PRINT 'TABUADA DO ' + CAST(@T AS VARCHAR(2)); -- é necessário converter para VARCHAR e tornar possível a concatenação
	PRINT ''; -- pula uma linha
	SET @N = 1;
	WHILE @N <= 10
	BEGIN
		PRINT CAST(@T AS VARCHAR(2)) + ' x ' + CAST(@N AS VARCHAR(2)) + ' = ' + CAST(@T*@N AS VARCHAR(3));
		SET @N += 1;
	END
	SET @T += 1;
	PRINT ''
END

-- lembrar! o CAST é utilizado para que o PRINT possa exibir a concatenação (não há conversão implícita)


-- NUMERO DA SORTE PARA JOGAR NA MEGASENA :)
DECLARE @DEZENA INT, @CONT INT = 1;
WHILE @CONT <= 6
BEGIN
    SET @DEZENA = 1 + 60 * RAND(); -- RAND retora um número randômico entre 0 e 1
	PRINT @DEZENA;
	SET @CONT += 1;
END

PRINT 'BOA SORTE';
