#11 - Ticket médio por bairro

WITH contagem AS (
SELECT bairro_aluno AS Bairro,
	   COUNT(id_aluno) AS QtdeAlunos
  FROM alunos
 WHERE status_aluno = 'Ativo'
 GROUP BY Bairro
),
valor AS (
SELECT a.bairro_aluno AS Bairro,
	   pl.valor_plano AS ValorTotal,
       pg.desconto AS Desconto,
       ROUND(pl.valor_plano - (pl.valor_plano * pg.desconto)) AS ValorPago
  FROM pagamentos pg
 INNER JOIN alunos a ON pg.id_aluno = a.id_aluno
 INNER JOIN planos pl ON pg.id_plano = pl.id_plano
 WHERE pg.status_pgto = 'Pago'
),
totalbairro AS (
SELECT Bairro,
	   SUM(ValorPago) AS ValorTotal
  FROM valor
 GROUP BY Bairro
)
SELECT c.Bairro AS Bairro,
	   ROUND(tb.ValorTotal / c.QtdeAlunos) AS TicketMedio
  FROM contagem c
 INNER JOIN totalbairro tb ON c.Bairro = tb.Bairro
 GROUP BY Bairro
 ORDER BY TicketMedio DESC