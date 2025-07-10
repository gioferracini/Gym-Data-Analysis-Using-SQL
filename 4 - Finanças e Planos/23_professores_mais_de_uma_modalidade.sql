#23 - Professores que ministram mais de 1 modalidade

SELECT pf.nome_prof AS Nome,
	   COUNT(pm.id_modalidade) AS QtdeModalidade
  FROM professores pf
 INNER JOIN professor_modalidade pm ON pf.id_prof = pm.id_prof
 GROUP BY Nome
 HAVING COUNT(pm.id_modalidade) > 1
 ORDER BY QtdeModalidade DESC