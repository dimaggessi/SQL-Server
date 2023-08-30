USE EMPRESA_DB;

-- MERGE
-- executa operações de inserção, atualização ou exclusão em uma tabela de destino
-- usando os resultados de uma união com uma tabela de origem, ou seja, sincroniza duas tabelas

CREATE TABLE dbo.TB_FUNCIONARIO_TEMP
(
    FuncionarioId int NOT NULL PRIMARY KEY,
	NomeCompleto varchar(70) NOT NULL,
	Cargo varchar(50) NOT NULL,
	DataNascimento datetime2(7) NOT NULL,
	Salario money NOT NULL
);

INSERT INTO dbo.TB_FUNCIONARIO_TEMP
(FuncionarioId, NomeCompleto, Cargo, DataNascimento, Salario)
SELECT FuncionarioId, NomeCompleto, Cargo, DataNascimento, Salario FROM dbo.TB_FUNCIONARIO

DELETE dbo.TB_FUNCIONARIO_TEMP WHERE FuncionarioId IN(1,2,3);

UPDATE dbo.TB_FUNCIONARIO_TEMP SET Salario = 500 WHERE FuncionarioId IN(9,8,7);

SELECT * FROM TB_FUNCIONARIO_TEMP;
SELECT * FROM TB_FUNCIONARIO;

-- SET IDENTITY_INSERT dbo.TB_FUNCIONARIO_TEMP ON; -- permite inserção nos campos do tipo IDENTITY
-- SET IDENTITY_INSERT dbo.TB_FUNCIONARIO_TEMP OFF; -- 'desliga' a possibilidade de inserção de dados

MERGE dbo.TB_FUNCIONARIO_TEMP AS ALVO
USING dbo.TB_FUNCIONARIO AS ORIGEM
    ON ALVO.FuncionarioId = ORIGEM.FuncionarioId
WHEN MATCHED AND ALVO.Salario <> ORIGEM.Salario
    THEN UPDATE SET ALVO.Salario = ORIGEM.Salario
WHEN NOT MATCHED
    THEN
	    INSERT (FuncionarioId, NomeCompleto, Cargo, DataNascimento, Salario)
		VALUES (FuncionarioId, NomeCompleto, Cargo, DataNascimento, Salario);


-- OUTPUT em instrução merge: retorna as linhas que foram alteradas, inseridas ou excluídas


-- ESTES ITENS INSERIDOS SERÃO DELETADOS DEPOIS DA CLÁUSULA WHEN NOT MATCHED BY SOURCE -- NO MERGE A SEGUIR
INSERT INTO dbo.TB_FUNCIONARIO_TEMP
(FuncionarioId, NomeCompleto, Cargo, DataNascimento, Salario)
VALUES
(123, 'MARIA DA SILVA', 'VENDEDOR(A)', '1968-12-08 00:00:00.0000000', 3333),
(321, 'JOÃO PRADO', 'VENDEDOR(A)', '1968-12-08 00:00:00.0000000', 3333);

-- FAZENDO UM NOVO MERGE UTILIZANDO OUTPUT
-- vai executar os comandos e
-- vai retornar a saída das alterações mostrando o que foi modificado, inserido ou excluído
MERGE dbo.TB_FUNCIONARIO_TEMP AS ALVO
USING dbo.TB_FUNCIONARIO AS ORIGEM
    ON ALVO.FuncionarioId = ORIGEM.FuncionarioId
WHEN MATCHED AND ALVO.Salario <> ORIGEM.Salario
    THEN UPDATE SET ALVO.Salario = ORIGEM.Salario
WHEN NOT MATCHED
    THEN
	    INSERT (FuncionarioId, NomeCompleto, Cargo, DataNascimento, Salario)
		VALUES (FuncionarioId, NomeCompleto, Cargo, DataNascimento, Salario)
	WHEN NOT MATCHED BY SOURCE THEN
	    DELETE
		OUTPUT
		    $ACTION AS [AÇÃO],
			INSERTED.FuncionarioId AS [FuncionarioId Após],
			DELETED.FuncionarioId AS [FuncionarioId Antes],
			INSERTED.NomeCompleto AS [NomeCompleto Após],
			DELETED.NomeCompleto AS [NomeCompleto Antes],
			INSERTED.Salario AS [Salário Após],
			DELETED.Salario AS [Salário Antes];

-- WHEN NOT MATCHED BY SOURCE 
--> cláusula que verifica se o atributo na tabela TB_FUNCIONARIO_TEMP não existe em TB_FUNCIONARIO (source)
