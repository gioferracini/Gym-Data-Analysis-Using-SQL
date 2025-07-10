#17 - Comparativo Faturamento x Receitas

WITH folha_salarial AS (
SELECT DATE_FORMAT(f.data_atividade, '%Y-%m') AS Mes,
	   ROUND(SUM(DISTINCT(pf.salario_prof)), 2) AS Total_Salario
  FROM professores pf
 INNER JOIN frequencia f ON pf.id_prof = f.id_prof
 GROUP BY Mes
 ORDER BY Mes ASC
 ),
 folha_despesas AS (
 SELECT DATE_FORMAT(pd.data_despesa, '%Y-%m') AS Mes,
	   SUM(d.valor_despesa) AS Total_Despesas
  FROM pagamentos_despesas pd
 INNER JOIN despesas d ON pd.id_despesa = d.id_despesa
 GROUP BY Mes
 ORDER BY Mes ASC
 ),
mensalidade AS (
SELECT DATE_FORMAT(pg.data_pagamento, '%Y-%m') AS Mes,
	   SUM(pl.valor_plano) AS ValorMensalidade
  FROM pagamentos pg
 INNER JOIN planos pl ON pg.id_plano = pl.id_plano
 WHERE pg.status_pgto = 'Pago'
 GROUP BY Mes
 ORDER BY Mes ASC
 ),
 vendasprodutos AS (
 SELECT DATE_FORMAT(vp.data_venda, '%Y-%m') AS Mes,
	   SUM(vp.quantidade_venda * p.valor_produto) AS TotalProduto 
  FROM produtos p 
 INNER JOIN vendas_produtos vp ON p.id_produto = vp.id_produto
 GROUP BY Mes
 ORDER BY Mes ASC
 ),
total AS (SELECT vp.Mes,
	   SUM(COALESCE(fs.Total_Salario, 0)) + SUM(COALESCE(fd.Total_Despesas, 0)) AS Faturamento,
	   SUM(COALESCE(m.ValorMensalidade, 0)) + SUM(COALESCE(vp.TotalProduto, 0)) AS Receita
  FROM folha_salarial fs
 RIGHT JOIN folha_despesas fd ON fs.Mes = fd.Mes
 RIGHT JOIN mensalidade m ON fs.Mes = m.Mes
 RIGHT JOIN vendasprodutos vp ON fs.Mes = vp.Mes
 GROUP BY vp.Mes
)
SELECT t.Mes,
	   t.Faturamento,
       t.Receita,
	   ROUND(t.Receita - t.Faturamento, 2) AS Diferenca
  FROM total t