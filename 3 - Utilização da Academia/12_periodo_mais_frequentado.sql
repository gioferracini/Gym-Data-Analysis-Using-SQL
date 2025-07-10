#12 - Período mais frequentado

SELECT horario AS Periodo,
	   COUNT(id_frequencia) AS Contagem
  FROM frequencia
 GROUP BY Periodo
 ORDER BY Contagem DESC
 