USE EMPRESA_DB;

-- BEGIN / END - usados para controle de fluxo de instruções

-- IF / ELSE - são utilizados para testar condições quando um comando Transact-SQL é executado

-- EXEMPLO 01
DECLARE @A INT = 10, @B INT = 15;
IF @A > @B
    BEGIN
	    PRINT @A
		PRINT 'É MAIOR QUE';
		PRINT @B;
	END
PRINT 'FIM EXEMPLO 01';
PRINT '-----';

-- EXEMPLO 02
SET @A = 15;
SET @B = 10;
IF @A > @B
    BEGIN
	    PRINT @A;
		PRINT 'É MAIOR QUE';
		PRINT @B;
	END
PRINT 'FIM EXEMPLO 02';
PRINT '-----';

-- EXEMPLO 03
SET @A = 15;
SET @B = 10;
IF @A > @B
    BEGIN
	    PRINT @A;
		PRINT 'É MAIOR QUE';
		PRINT @B;
	END
ELSE
    BEGIN
	    PRINT @A;
		PRINT 'NÃO É MAIOR QUE';
		PRINT @B;
	END
PRINT 'FIM EXEMPLO 03';
PRINT '-----';

-- QUANDO A VALIDAÇÃO FOR DE UMA ÚNICA LINHA, É POSSÍVEL OMITIR O 'BEGIN' E O 'END'
IF OBJECT_ID('TB_TESTE', 'U') IS NULL
        CREATE TABLE TB_TESTE (ID VARCHAR(15))
