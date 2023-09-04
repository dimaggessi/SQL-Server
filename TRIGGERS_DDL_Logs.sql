USE EMPRESA_DB;

-- TRIGGERS DDL
-- são executados em resposta a eventos DDL

-- trigger que captura os eventos executados (CREATE, ALTER, DROP)
CREATE TRIGGER TRG_LOG_BANCO
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS BEGIN
	DECLARE @DATA XML, @MSG VARCHAR(5000);

	SET @DATA = EVENTDATA();

	SET @MSG = @DATA.value('(/EVENT_INSTANCE/EventType)[1]','VARCHAR(100)');
	PRINT @MSG;

	SET @MSG = @DATA.value('(/EVENT_INSTANCE/ObjectType)[1]','VARCHAR(100)');
	PRINT @MSG;

	SET @MSG = @DATA.value('(/EVENT_INSTANCE/ObjectName)[1]','VARCHAR(100)');
	PRINT @MSG;

	SET @MSG = @DATA.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','VARCHAR(100)');
	PRINT @MSG;
END

CREATE TABLE TESTE (ID INT, NOME VARCHAR(35));
ALTER TABLE TESTE ADD E_MAIL VARCHAR(120);
DROP TABLE TESTE;

-- seria possível usar esse trigger para salvar alterações em tabela ou views
-- ou até mesmo somente para printar na tela as alterações que foram feitas