-- STORED PROCEDURES
-- conjunto de comandos SQL
-- permanente ou temporária

-- procedure temporária local (mesma sessão)
-- procedure temporária global (qualquer sessão)

-- EXECUÇÃO:
-- execução no momento que o SQL Server é iniciado
-- execução em períodos específicos do dia
-- execução em um horário específico do dia

-- PARÂMETROS:
-- aceitam parâmetros de entrada e saída

-- RETORNO:
-- retorno do tipo status, com o objetivo e indicar sucesso ou falha
-- falha: indica o motivo

/*

  sysobjects - armazena o nome da stored procedure

  syscomments - armazena os comandos da stored procedure

*/

-- VANTAGENS:
-- execução rápida, com sintaxe previamente verificada e podem ser acessadas a partir do cache, depois da primeira execução
-- diminuem o tráfego na rede
-- segurança: podem ser aproveitadas como um mecanismo de segurança, restringindo o acesso às tabelas
-- programação modular: após criadas, podem ser chamadas a partir de qualquer aplicação

-- COMANDOS QUE NÃO PODEM SER USADOS DENTRO DE STORED PROCEDURES:
/*
	create procedure
	create default
	create rule
	create trigger
	create view
*/

-- @@NESTLEVEL mostra o nível de aninhamento da procedure
-- é possível aninhar até 32 procedures

CREATE PROCEDURE PROC_A
AS
BEGIN
    PRINT 'PROC_A ' + CAST(@@NESTLEVEL AS VARCHAR(2));
	EXEC PROC_B;
	PRINT 'VOLTEI PARA PROC_A';
END

CREATE PROCEDURE PROC_B
AS
BEGIN
    PRINT 'PROC_B ' + CAST(@@NESTLEVEL AS VARCHAR(2));
	EXEC PROC_C;
	PRINT 'VOLTEI PARA PROC_B';
END

CREATE PROCEDURE PROC_C
AS
BEGIN
    PRINT 'PROC_C ' + CAST(@@NESTLEVEL AS VARCHAR(2));
END

EXEC PROC_A; -- EXECUTA A PROCEDURE

DROP PROCEDURE PROC_A;
DROP PROCEDURE PROC_B;
DROP PROCEDURE PROC_C;
