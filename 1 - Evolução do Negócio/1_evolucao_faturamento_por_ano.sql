#1 - Evolução do Faturamento por ano

WITH folha_salarial AS (
SELECT DATE_FORMAT(f.data_atividade, '%Y-%m') AS Mes,
	   ROUND(SUM(DISTINCT(pf.salario_prof)), 2) AS Total_Salario
  FROM professores pf
 INNER JOIN frequencia f ON pf.id_prof = f.id_prof
 GROUP BY Mes
 ORDER BY Mes ASC
 ),
 folha_despesas AS (
 SELECT DATE_FORMAT(pd.data_despesa, '%Y-%m') AS Mes,
	   SUM(d.valor_despesa) AS Total_Despesas
  FROM pagamentos_despesas pd
 INNER JOIN despesas d ON pd.id_despesa = d.id_despesa
 GROUP BY Mes
 ORDER BY Mes ASC
 )
SELECT fd.Mes AS Mes,
	   COALESCE(fs.Total_Salario, 0) AS TotalSalario,
       COALESCE(fd.Total_Despesas, 0) AS TotalDespesas,
       COALESCE(fs.Total_Salario, 0) + COALESCE(fd.Total_Despesas, 0) AS TotalFaturamento
  FROM folha_salarial fs
 RIGHT JOIN folha_despesas fd ON fs.Mes = fd.Mes
 