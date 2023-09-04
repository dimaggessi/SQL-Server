USE EMPRESA_DB;

-- Trigger de Logon - permite auditar o acesso e bloquear acessos indevidos

CREATE LOGIN ADMIN_TESTE WITH PASSWORD = 'ADMIN@123';

CREATE TRIGGER TRG_BLOQUEIO_SSMS
ON ALL SERVER
FOR LOGON
AS
BEGIN
	IF (ORIGINAL_LOGIN() LIKE 'Admin_' AND APP_NAME() LIKE 'Microsoft SQL Server Management Studio%')
	ROLLBACK;
END

-- impede um usuário de se conectar (no caso o ADMIN_TESTE)