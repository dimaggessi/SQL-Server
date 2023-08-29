
-- UPDATE AND DELETE
-- as colunas a serem alteradas com instruções UPDATE, INSERT ou DELETE devem pertencer a uma mesma tabela base
-- as colunas alteradas em uma view devem referenciar diretamente os dados originais nas colunas da tabela.

-- PARA SER POSSÍVEL MODIFICAR - as colunas não podem ser computadas ou derivadas pelo uso de funções de agrupamento
-- como AVG, COUNT, SUM, MIN, MAX, GROUPING, STDEV, STDEVP, VAR e VARP.

-- Para poderem ser modificadas, colunas que tiverem sido computadas por uma expressão ou pelos operadores
-- UNION, UNION ALL, CROSSJOIN, EXCEPT e INTERSECT devem ser especificadas com um trigger INSTEAD OF.

-- As colunas a serem alteradas não serão afetadas pelo uso das cláusulas GROUP BY, HAVING ou DISTINCT.

-- É necessário, por meio da instrução INSERT, especificar valores para todas as colunas da tabela original 
-- que não permitem valores nulos
-- e que não tenham definições DEFAULT

-- TOP não pode ser utilizado com WITH CHECK OPTION no SELECT a ser gravado na view.

-- RECOMENDAÇÃO: caso tenha necessidade de alterar dados, fazer diretamente na Tabela
-- a VIEW pode estar criptografada e você não terá acesso aos dados
-- além disso, cria uma camada de complexidade.