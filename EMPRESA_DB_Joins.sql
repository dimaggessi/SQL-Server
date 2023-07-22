USE EMPRESA_DB;

-- INNER JOIN (or only JOIN)
-- note: It is possible to use another field unless PK or FK
SELECT TOP 10 C.NomeCompleto,
	   C.Cargo,
	   C.Contato,
	   E.Logradouro,
	   E.Cidade, 
	   E.Pais 
FROM TB_CLIENTE AS C
INNER JOIN 
TB_ENDERECO AS E ON C.ClienteId = E.ClienteId
ORDER BY NomeCompleto DESC;

-- LEFT JOIN (all of left and inner join with the right)
SELECT C.NomeCompleto,
	   C.Cargo,
	   E.Logradouro,
	   E.Cidade,
	   E.Pais
FROM TB_ENDERECO AS E LEFT JOIN TB_CLIENTE AS C
ON C.ClienteId = E.ClienteId;

--
INSERT INTO TB_CLIENTE
(ClienteId, NomeCompleto, Contato, Cargo)
VALUES
('AAAAA', 'MARCOS ALBERTO', 'MARIA JOAQUINA', 'VENDEDOR'),
('BBBBB', 'MONICA SANTOS', 'JOSE SILVE', 'ATENDENTE DE MARKETING'),
('CCCCC', 'JOANA ALVES', 'ANA TRUJILO', 'PROPRIETARIA');
--

-- RIGHT JOIN (all of right and inner join with the left)
SELECT C.NomeCompleto,
	   C.Cargo,
	   E.Logradouro,
	   E.Cidade,
	   E.Pais
FROM TB_ENDERECO AS E RIGHT JOIN TB_CLIENTE AS C
ON C.ClienteId = E.ClienteId;


-- UPDATE WITH JOIN
UPDATE TB_PRODUTO
SET Preco += 1
FROM TB_PRODUTO P
JOIN TB_CATEGORIA C
ON P.CategoriaId = C.CategoriaId
WHERE C.Descricao = 'Condimentos';


-- DELETE WITH JOIN
DELETE FROM TB_DETALHE_PEDIDO
FROM TB_PEDIDO AS P
JOIN TB_FUNCIONARIO AS F
ON P.FuncionarioId = F.FuncionarioId
JOIN TB_DETALHE_PEDIDO AS D
ON P.NumeroPedido = D.NumeroPedido
WHERE F.Cargo = 'Vice-Presidente de Vendas';

DELETE FROM TB_PEDIDO
FROM TB_PEDIDO AS P
JOIN TB_FUNCIONARIO AS F
ON P.FuncionarioId = F.FuncionarioId
WHERE F.Cargo = 'Vice-Presidente de Vendas';

SELECT * FROM TB_PEDIDO AS P
JOIN TB_FUNCIONARIO AS F
ON P.FuncionarioId = F.FuncionarioId
WHERE F.Cargo = 'Vice-Presidente de Vendas';





