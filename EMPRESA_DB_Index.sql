USE EMPRESA_DB;

-- INDEX: Organizados em estrutura de árvore

-- CLUSTERED INDEX:

-- classificam e armazenam as linhas de uma tabela com base em seus valores de chave.
-- apenas um por tabela, geralmente o índice clusterizado é associado a PRIMARY KEY, armazenado junto com ela
-- eles ordenam fisicamente as linhas e os índices, e mantêm eles próximos uns dos outros

-- NONCLUSTERED:

-- Ao contrário, os índices não clusterizados não possuem comportamento de ordenação (são linhas salvas aleatoriamente)
-- geralmente identificadas por ponteiros
-- número máximo de 999 por tabela (ao contrário do clusterizado, que é apenas um)
-- No momento em que é criada uma tabela sem PRIMARY KEY é criado um índice não clusterizado.

-- UNIQUE: não é permitida duplicidade do campo

CREATE TABLE dbo.TesteIndex
(
	CPF VARCHAR(11) NOT NULL,
	Nome VARCHAR(50) NULL,
	RG VARCHAR(10) NULL
);

-- CRIAR INDEX
CREATE UNIQUE CLUSTERED INDEX IX_CPF
ON dbo.TesteIndex (CPF ASC);

CREATE NONCLUSTERED INDEX IX_RG
ON dbo.TesteIndex (RG DESC);

-- CRIAR INDEX COMPOSTO
CREATE NONCLUSTERED INDEX IX_RG_Nome
ON dbo.TesteIndex(RG,Nome);

-- REMOVER O INDEX
DROP INDEX dbo.TesteIndex.IX_RG;

-- VER INFORMAÇÕES DOS INDEX CRIADOS
EXEC sp_helpindex TesteIndex;