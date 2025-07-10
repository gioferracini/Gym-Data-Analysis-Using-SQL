#14 - Modalidades mais frequentes

SELECT m.nome_modalidade AS Nome_Modalidade,
	   COUNT(f.id_frequencia) AS Contagem
  FROM frequencia f
 INNER JOIN modalidades m ON f.id_modalidade = m.id_modalidade
 GROUP BY Nome_Modalidade
 ORDER BY Contagem DESC