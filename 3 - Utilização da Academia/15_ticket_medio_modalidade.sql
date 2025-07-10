#15 - Ticket médio por modalidade

WITH aluno_modalidade AS (
  SELECT DISTINCT f.id_aluno, f.id_modalidade
  FROM frequencia f
)
SELECT 
  mo.nome_modalidade AS NomeModalidade,
  ROUND(SUM(pl.valor_plano) / COUNT(am.id_aluno), 2) AS TicketMedio
FROM aluno_modalidade am
INNER JOIN modalidades mo ON am.id_modalidade = mo.id_modalidade
INNER JOIN pagamentos pg ON pg.id_aluno = am.id_aluno AND pg.status_pgto = 'Pago'
INNER JOIN planos pl ON pg.id_plano = pl.id_plano
GROUP BY NomeModalidade
ORDER BY TicketMedio DESC;
