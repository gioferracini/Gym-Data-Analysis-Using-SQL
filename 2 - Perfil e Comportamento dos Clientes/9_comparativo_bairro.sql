#9 - Comparativo por bairro

SELECT bairro_aluno AS 'Bairro',
	   COUNT(id_aluno) AS 'Contagem'
  FROM alunos
 GROUP BY bairro_aluno
 ORDER BY COUNT(id_aluno) DESC