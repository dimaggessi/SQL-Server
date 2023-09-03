USE EMPRESA_DB;

-- TRIGGERS DML
/*
	Programada para executar quando as instruções UPDATE, INSERT ou DELETE 
	são executadas em uma tabela ou view
	Podem prevenir operações incorretas ou mal intencionadas

	TRIGGER INSERT -- executada quando dados são inseridos
	TRIGGER UPDATE -- executada quando dados são atualizados  (de uma tabela ou view)
	TRIGGER DELETE -- executada quando dados são removidos
*/

-- tabela que armazena as alterações de salário dos funcionários
CREATE TABLE TB_HIST_SALARIO
(
	FuncionarioId INT PRIMARY KEY,
	DATA_ALTERACAO DATETIME2 DEFAULT GETDATE(),
	SALARIO_ANTIGO MONEY,
	SALARIO_NOVO MONEY,
	CONSTRAINT FK_TB_HIST_SALARIO_FUNCIONARIO FOREIGN KEY (FuncionarioId)
	REFERENCES TB_Funcionario(FuncionarioId)
);

-- Trigger que armazena as mudanças no salário
-- a tabela deleted armazena o valor antigo que estava na tabela e que vai ser substituído
-- já a tabela inserted armazena o valor que vai ser inserido
CREATE TRIGGER TRG_FUNCIONARIOS_HIST_SALARIO ON TB_FUNCIONARIO
FOR UPDATE
AS BEGIN
	DECLARE @FUNCIONARIO_ID INT, @SALARIO_ANTIGO MONEY, @SALARIO_NOVO MONEY;

	SELECT @SALARIO_ANTIGO = Salario FROM deleted;
	SELECT @FUNCIONARIO_ID = FuncionarioId, @SALARIO_NOVO = Salario FROM inserted;

	IF @SALARIO_ANTIGO <> @SALARIO_NOVO
	BEGIN
		INSERT INTO TB_HIST_SALARIO
		(FuncionarioId, SALARIO_ANTIGO, SALARIO_NOVO)
		VALUES
		(@FUNCIONARIO_ID, @SALARIO_ANTIGO, @SALARIO_NOVO)
	END
END

UPDATE TB_FUNCIONARIO
SET Salario = 6500.00
WHERE FuncionarioId = 1;

SELECT * FROM TB_FUNCIONARIO
WHERE FuncionarioId = 1;

SELECT * FROM TB_HIST_SALARIO;