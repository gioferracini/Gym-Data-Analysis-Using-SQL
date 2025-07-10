#2 - Evolução de Receitas por ano
 
WITH mensalidade_desconto AS (
SELECT DATE_FORMAT(pg.data_pagamento, '%Y-%m') AS Mes,
	   pl.valor_plano AS ValorTotal,
       pg.desconto AS Desconto, 
       ROUND(pl.valor_plano - (pl.valor_plano * pg.desconto)) AS ValorMensalidade
  FROM pagamentos pg
 INNER JOIN planos pl ON pg.id_plano = pl.id_plano
 WHERE pg.status_pgto = 'Pago'
 ),
 mensalidade_total AS (
 SELECT Mes,
		SUM(ValorMensalidade) AS ValorMensalidade
   FROM mensalidade_desconto
  GROUP BY Mes
 ),
 vendasprodutos AS (
 SELECT DATE_FORMAT(vp.data_venda, '%Y-%m') AS Mes,
	   SUM(vp.quantidade_venda * p.valor_produto) AS TotalProduto 
  FROM produtos p 
 INNER JOIN vendas_produtos vp ON p.id_produto = vp.id_produto
 GROUP BY Mes
 )
SELECT mt.Mes AS Mes,
	   mt.ValorMensalidade AS Mensalidade,
       vp.TotalProduto AS TotalProduto,
       (mt.ValorMensalidade + vp.TotalProduto) AS TotalReceita
  FROM mensalidade_total mt
 RIGHT JOIN vendasprodutos vp ON mt.Mes = vp.Mes
 