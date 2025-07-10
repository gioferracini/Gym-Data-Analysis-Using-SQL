#13 - Dias da semana mais frequentados

SELECT dia_semana AS Dia_Semana,
	   COUNT(id_frequencia) AS Contagem
  FROM frequencia
 GROUP BY Dia_Semana
 ORDER BY Contagem DESC
 