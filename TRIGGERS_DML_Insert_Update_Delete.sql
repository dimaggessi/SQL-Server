USE EMPRESA_DB;

ALTER TABLE TB_PEDIDO
ADD VALOR_TOTAL MONEY DEFAULT 0

CREATE TRIGGER TRG_CORRIGE_VLR_TOTAL ON TB_DETALHE_PEDIDO
FOR DELETE, INSERT, UPDATE
AS BEGIN
	-- PARA EVENTO DE DELETE
	IF NOT EXISTS(SELECT * FROM inserted) -- se não existir valores na tabela inserted, então é um evento de 'delete'
	BEGIN
		UPDATE TB_PEDIDO
		SET VALOR_TOTAL = (SELECT SUM(D.Preco * D.Quantidade) FROM TB_DETALHE_PEDIDO D
							WHERE P.NumeroPedido = D.NumeroPedido)
							FROM TB_PEDIDO P JOIN deleted
							ON P.NumeroPedido = deleted.NumeroPedido;
	
	END
	-- PARA EVENTO DE UPDATE OU INSERT
	ELSE
	BEGIN
		UPDATE TB_PEDIDO
		SET VALOR_TOTAL = (SELECT SUM(D.Preco * D.Quantidade) FROM TB_DETALHE_PEDIDO d
							WHERE P.NumeroPedido = D.NumeroPedido)
							FROM TB_PEDIDO P JOIN inserted
							ON P.NumeroPedido = inserted.NumeroPedido;
	END
END

SELECT * FROM TB_PEDIDO WHERE NumeroPedido = 10249;

SELECT * FROM TB_DETALHE_PEDIDO WHERE NumeroPedido = 10249;

UPDATE TB_DETALHE_PEDIDO
SET Quantidade = 11
WHERE NumeroPedido = 10249 AND ProdutoId = 14;

