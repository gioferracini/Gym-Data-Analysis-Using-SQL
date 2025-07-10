#6 - Evolução da venda de produtos

 SELECT DATE_FORMAT(vp.data_venda, '%Y-%m') AS Mes,
	   SUM(vp.quantidade_venda * p.valor_produto) AS TotalProduto 
  FROM produtos p 
 INNER JOIN vendas_produtos vp ON p.id_produto = vp.id_produto
 GROUP BY Mes
 ORDER BY Mes ASC