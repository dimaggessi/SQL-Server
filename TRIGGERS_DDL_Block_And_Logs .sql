USE EMPRESA_DB;

CREATE TRIGGER TRG_BLOQUEIO_CREATE_TABLE
ON DATABASE
FOR CREATE_TABLE
AS BEGIN
	SELECT EVENTDATA().value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]','VARCHAR(MAX)');
	RAISERROR('Não é possível criar novas tabelas, procure o admin para isso.', 16, 1); -- RAISERROR(msg, nível de severidade do erro, status do erro)
	ROLLBACK; -- desfaz o comando CREATE TABLE do usuário
END

CREATE TABLE TB_TABELA_TESTE(ID INT);
/*
Msg 50000, Level 16, State 1, Procedure TRG_BLOQUEIO_CREATE_TABLE, Line 6 [Batch Start Line 11]
Não é possível criar novas tabelas, procure o admin para isso.
Msg 3609, Level 16, State 2, Line 12
The transaction ended in the trigger. The batch has been aborted.
*/

-- trigger para armazenar logs
CREATE TABLE TB_DDL_LOG
(
    DataCriacao DATETIME2,
	DB_User VARCHAR(100),
	EVENTO VARCHAR(100),
	TSQL_COMMAND VARCHAR(5000)
);

CREATE TRIGGER TRG_LOG_DATA_BASE
ON DATABASE
FOR DDL_DATABASE_LEVEL_EVENTS
AS 
BEGIN
	DECLARE @DATA XML;
	SET @DATA = EVENTDATA();

	INSERT INTO TB_DDL_LOG
	(DataCriacao, DB_User, EVENTO, TSQL_COMMAND)
	VALUES
	(GETDATE(), CONVERT(VARCHAR(100), CURRENT_USER),
	@DATA.value('(/EVENT_INSTANCE/EventType)[1]', 'VARCHAR(100)'),
	@DATA.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'VARCHAR(5000)'))
END

CREATE TABLE TESTE_TABELA (ID INT);
DROP TABLE TESTE_TABELA;

SELECT * FROM TB_DDL_LOG;