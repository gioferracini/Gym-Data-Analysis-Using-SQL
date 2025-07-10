#18 - Comparativo salarial professores (Geral)

SELECT pf.nome_prof AS Nome,
	   pf.perfil_prof AS Nivel,
       pf.idade_prof AS Idade,
       COUNT(pm.id_modalidade) AS QtdeModalidade,
       pf.salario_prof AS Salario
  FROM professores pf
 INNER JOIN professor_modalidade pm ON pf.id_prof = pm.id_prof
 GROUP BY Nome, Nivel, Idade, Salario
 ORDER BY Salario DESC
 LIMIT 10