USE EMPRESA_DB;

-- TRIGGER INSTEAD OF
-- ele sobrescreve a ação que está sendo executada para executar o comando do trigger

-- adicionando um campo de cliente ativo
ALTER TABLE TB_CLIENTE
ADD Ativo BIT DEFAULT 1;

-- atualiza todos os clientes registrados 
UPDATE TB_CLIENTE
SET Ativo = 1;

-- criando trigger que ao invés de deletar o cliente, muda o status
SELECT * FROM TB_CLIENTE;
GO
CREATE TRIGGER TRG_DESATIVA_CLIENTE ON TB_CLIENTE
INSTEAD OF DELETE
AS BEGIN
	UPDATE TB_CLIENTE SET Ativo = 0
	FROM TB_CLIENTE C JOIN deleted D ON C.ClienteId = D.ClienteId
END


DELETE TB_CLIENTE
WHERE ClienteId = 'ALFKI';