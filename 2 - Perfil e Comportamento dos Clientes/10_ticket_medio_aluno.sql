#10 - Ticket médio por aluno

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
		SUM(ValorMensalidade) AS TotalMensalidade
   FROM mensalidade_desconto
  GROUP BY Mes
 ),
matriculas AS (SELECT 
  DATE_FORMAT(data_matricula_aluno, '%Y-%m') AS Mes,
  COUNT(id_aluno) AS Matriculas,
  SUM(COUNT(id_aluno)) OVER (ORDER BY DATE_FORMAT(data_matricula_aluno, '%Y-%m')) AS Matriculados
FROM alunos
WHERE status_aluno = 'Ativo'
GROUP BY Mes
ORDER BY Mes ASC
)
SELECT ma.Mes AS Mes,
       ROUND(mt.TotalMensalidade / ma.Matriculados, 2) AS TicketMedio
  FROM mensalidade_total mt 
 INNER JOIN matriculas ma ON mt.Mes = ma.Mes