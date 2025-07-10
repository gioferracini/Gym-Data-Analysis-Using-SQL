#8 - Comparativo por faixa etária

SELECT 
faixa_etaria AS 'Idade',
SUM(CASE WHEN sexo_aluno = 'M' THEN 1 ELSE 0 END) AS 'Masculino',
SUM(CASE WHEN sexo_aluno = 'F' THEN 1 ELSE 0 END) AS 'Feminino',
COUNT(*) as 'Total'
FROM (
SELECT CASE 
	WHEN idade_aluno BETWEEN 15 AND 20 THEN '15 a 20 anos'
	WHEN idade_aluno BETWEEN 21 AND 25 THEN '21 a 25 anos'
	WHEN idade_aluno BETWEEN 26 AND 30 THEN '26 a 30 anos'
	WHEN idade_aluno BETWEEN 31 AND 35 THEN '31 a 35 anos'
	WHEN idade_aluno BETWEEN 36 AND 40 THEN '36 a 40 anos'
	WHEN idade_aluno BETWEEN 41 AND 45 THEN '41 a 45 anos'
	WHEN idade_aluno BETWEEN 46 AND 50 THEN '46 a 50 anos'
    WHEN idade_aluno BETWEEN 51 AND 55 THEN '51 a 55 anos'
	WHEN idade_aluno BETWEEN 56 AND 60 THEN '56 a 60 anos'
	WHEN idade_aluno BETWEEN 61 AND 65 THEN '61 a 65 anos'
	WHEN idade_aluno BETWEEN 66 AND 70 THEN '66 a 70 anos'    
    WHEN idade_aluno BETWEEN 71 AND 75 THEN '71 a 75 anos'
    WHEN idade_aluno BETWEEN 76 AND 80 THEN '76 a 80 anos'
	ELSE 'Acima de 80 anos'
	END AS faixa_etaria,
    sexo_aluno
  FROM alunos
  WHERE status_aluno = 'Ativo'
) AS base
GROUP BY faixa_etaria
ORDER BY faixa_etaria