#20 - Comparativo por plano

SELECT pl.nome_plano AS Nome,
	  COUNT(DISTINCT a.id_aluno) AS Qtde
  FROM planos pl
 INNER JOIN pagamentos pg ON pl.id_plano = pg.id_plano
 INNER JOIN alunos a ON pg.id_aluno = a.id_aluno
 WHERE a.status_aluno = 'Ativo'
   AND pg.status_pgto = 'Pago'
 GROUP BY Nome
 ORDER BY Qtde DESC