#7 - Sexo mais frequente nas aulas

SELECT a.sexo_aluno AS Sexo,
	   COUNT(DISTINCT(f.id_aluno)) AS Contagem
  FROM frequencia f
 INNER JOIN alunos a ON f.id_aluno = a.id_aluno
 WHERE a.status_aluno = 'Ativo'
 GROUP BY Sexo
 ORDER BY Contagem DESC