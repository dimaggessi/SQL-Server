
-- TEMPORARY TABLES
-- quando criadas são salvas no banco de dados de sistemas TempDB e podem ser de dois tipos:

/*
 [Local]:
     criadas com prefixo '#' antes do nome da tabela,
	 visíveis apenas na conexão responsável por sua criação

 [Global]:
     criadas com prefixo '##' antes do nome da tabela,
	 visíveis por todas as conexões com o DB
*/

-- tabelas temporárias são utilizadas ao escrever scripts ex: stored procedures
-- tabelas temporárias são usadas para armazenar dados de diferentes tabelas

-- LOCAL TEMP -- está visível apenas nessa conexão
CREATE TABLE #TB_TEMP
(
    NOME VARCHAR(50) NULL
);

INSERT #TB_TEMP
VALUES
('JOSÉ AUGUSTO');

SELECT * FROM #TB_TEMP

-- GLOBAL TEMP -- visível em qualquer conexão
CREATE TABLE ##TB_TEMP_02
(
    NOME VARCHAR(50) NULL
);

INSERT ##TB_TEMP_02
VALUES
('VATAPÁ ALADO');

SELECT * FROM ##TB_TEMP_02;


