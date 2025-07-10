#16 - Produtos mais vendidos

WITH preco AS (
SELECT id_produto AS ID,
	   nome_produto AS NomeProduto,
	   valor_produto AS ValorUnit
  FROM produtos
),
qtde AS (
SELECT id_produto AS ID,
	   SUM(quantidade_venda) AS Qtde
  FROM vendas_produtos
 GROUP BY ID
)
SELECT p.NomeProduto AS Nome,
	   ValorUnit * Qtde AS ValorTotal
  FROM preco p
 INNER JOIN qtde q ON p.ID = q.ID
 ORDER BY ValorTotal DESC