USE EMPRESA_DB;


-- RETURN - possibilita sinalizar erro na execução
CREATE PROCEDURE STP_ULT_DATA_PEDIDO @CLIENTE_ID VARCHAR(10)
AS BEGIN
	IF NOT EXISTS(SELECT * FROM TB_PEDIDO WHERE ClienteId = @CLIENTE_ID)
		RETURN -1;

	SELECT MAX(DataPedido) AS ULTIMA_DATA_PEDIDO FROM TB_PEDIDO
	WHERE ClienteId = @CLIENTE_ID;
END

-- EXECUTANDO A PROCEDURE
-- definindo uma variável que vai receber um inteiro que indicará falha na execução
DECLARE @RESULTADO INT;
EXEC @RESULTADO = STP_ULT_DATA_PEDIDO 'ASDFSADF'
IF @RESULTADO < 0 PRINT 'Não existe pedido para esse cliente';

DECLARE @RESULTADO INT;
EXEC @RESULTADO = STP_ULT_DATA_PEDIDO 'HANAR'
IF @RESULTADO < 0 PRINT 'Não existe pedido para esse cliente';

