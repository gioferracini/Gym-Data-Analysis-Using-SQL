#21 - Participação dos planos no faturamento total

WITH valor AS (
SELECT pl.nome_plano AS Nome,
	   SUM(pl.valor_plano) AS Valor
  FROM pagamentos pg
 INNER JOIN planos pl ON pg.id_plano = pl.id_plano
 WHERE pg.status_pgto = 'Pago'
 GROUP BY Nome
),
fatutotal AS (
SELECT SUM(pl.valor_plano) AS ValorTotal
  FROM pagamentos pg
 INNER JOIN planos pl ON pg.id_plano = pl.id_plano
 WHERE pg.status_pgto = 'Pago'
)
SELECT v.Nome AS NomePlano,
	ROUND(((Valor / ValorTotal)  * 100), 2) AS Percentual   
  FROM valor v
 CROSS JOIN fatutotal
 ORDER BY Percentual DESC