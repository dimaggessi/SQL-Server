USE EMPRESA_DB;

-- USER DEFINED FUNCTIONS -- definidas pelo usuário (já existem funções nativas na pasta System Fuctions)

/* FUNÇÕES POSSUEM SEMELHANÇA COM STORED PROCEDURES
-- ambas aceitam parâmetros para realizar consultas sem conhecimento profundo da estrutura do DB
-- ambas podem ter sua lógica compartilhada com um ou mais aplicativos
-- são executadas no servidor de dados

    FUNÇÕES NÃO PODEM REALIZAR ALTERAÇÃO DE DADOS NO SISTEMA
--> não aceita dados do tipo cursor, table ou timestamp
--> retorna um valor único escalar ou dados de uma tabela

--> ENCRYPTION -> impossibilita ver como a função foi criada
--> SCHEMABINDING -> associa a função a um objeto no banco de dados que são referenciados por ela

--> UPDATE e DELETE não podem ser usados no corpo da função!!

   FUNÇÕES ESCALARES:
--> exemplo: criar função que retorna o faturameto por número pedido
*/

CREATE FUNCTION FaturamentoDetalhePedido (@NUMERO_PEDIDO AS INT)
RETURNS FLOAT
AS
BEGIN
    DECLARE @FATURAMENTO FLOAT;

	SELECT @FATURAMENTO = SUM(Quantidade * Preco) FROM TB_DETALHE_PEDIDO
    WHERE NumeroPedido = @NUMERO_PEDIDO

	RETURN @FATURAMENTO;
END

-- USANDO A FUNÇÃO
SELECT NumeroPedido, dbo.FaturamentoDetalhePedido(NumeroPedido) AS FATURAMENTO FROM TB_PEDIDO;


-- FUNÇÕES TABULARES IN-LINE
-- não possui corpo de função e pode ser utilizada para conseguir a funcionalidade de views
-- porém com a utilização de parâmetros

-- FUNÇÕES TABULARES C/ VÁRIAS INSTRUÇÕES
-- pode possui uma ou mais instruções select e/ ou views
-- utiliza múltiplas instruções T-SQL para construir uma tabela
-- pode ser usada em uma cláusula FROM (assim como as views)

-- Função Tabular IN-LINE
CREATE FUNCTION ListarPedidoCliente(@CLIENTE_ID AS VARCHAR(15))
RETURNS TABLE
AS
RETURN SELECT * FROM TB_PEDIDO WHERE ClienteId = @CLIENTE_ID;


-- utilizando as funções criadas
SELECT DISTINCT C1.ClienteId,
       C1.TOTAL_PEDIDOS,
	   C2.TOTAL_FATURAMENTO
FROM
	(SELECT ClienteId,
		  (SELECT COUNT(*) FROM dbo.ListarPedidoCliente(ClienteId)) AS TOTAL_PEDIDOS
	FROM TB_PEDIDO) AS C1
	INNER JOIN
	(SELECT ClienteId,
		   SUM(dbo.FaturamentoDetalhePedido(NumeroPedido)) AS TOTAL_FATURAMENTO
	FROM TB_PEDIDO
	GROUP BY ClienteId) AS C2
ON C1.ClienteId = C2.ClienteId;


-- ALTERAR FUNÇÕES:
ALTER FUNCTION ListarPedidoCliente(@NUMERO_PEDIDO AS INT)
RETURNS TABLE
AS
RETURN SELECT * FROM TB_PEDIDO WHERE NumeroPedido = @NUMERO_PEDIDO;

-- EXCLUIR FUNÇÕES:
DROP FUNCTION dbo.ListarPedidoCliente