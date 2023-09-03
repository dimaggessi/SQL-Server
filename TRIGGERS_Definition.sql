-- TRIGGERS (gatilhos)

-- triggers tem a função de disparar stored procedures
-- possuem acionamento automático e não recebem ou retornam parâmetros
-- a trigger e o comando que a disparou são tratados como sendo de uma única transação
-- e assim pode ser desfeita com o comando ROLLBACK TRANSACTION

/*
	Triggers DDL - em situações de comandos DDL alter, drop, create
	Triggers DML - em situações de comandos DML insert, delete, update
					e realizam alterações em views e tabelas

			são ainda classificados em INSTEAD OF e AFTER

	Triggers Logon - disparam stored procedures em eventos do tipo logon (conexão de usuário)
				    usadas para auditar e gerenciar sessões
*/

-- Triggers atuam de forma reativa (o comando SQL é executado primeiro)
-- Constraints diferem de triggers, pois o comando SQL é executado depois da validação da constraint

/*
  triggers não podem ser criados em tabelas temporárias (mas podem referênciá-las)
  triggers podem ser criadas apenas no banco de dados atual, mas podem referenciar objetos externos

  é possível adicionar triggers a outros triggers já existentes, desde que não tenham nomes iguais
	(isso é permitido até 70 vezes - "acionamento em cascata")
*/

/*
	FOR -> executa a trigger ao mesmo tempo que o comando SQL
	AFTER -> executa a trigger depois do comando SQL
	INSTEAD OF -> executa a trigger no lugar do comando SQL
*/
