#3 - Evolução de Matrículas de alunos por ano

SELECT DATE_FORMAT(data_matricula_aluno, '%Y-%m') AS Mes,
	   COUNT(data_matricula_aluno) AS 'Contagem'
  FROM alunos
 GROUP BY Mes
 ORDER BY Mes ASC