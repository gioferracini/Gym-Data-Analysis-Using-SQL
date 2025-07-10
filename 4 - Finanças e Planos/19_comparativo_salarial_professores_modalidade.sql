#19 - Comparativo salarial professores (por Modalidade)

WITH professor AS (
    SELECT 
        mo.nome_modalidade AS Modalidade,
        pf.nome_prof AS Nome,
        pf.perfil_prof AS Nivel,
        pf.idade_prof AS Idade,
        pf.salario_prof AS Salario,
        ROW_NUMBER() OVER (PARTITION BY mo.nome_modalidade ORDER BY pf.salario_prof DESC) AS rn
    FROM professores pf
    INNER JOIN professor_modalidade pm ON pf.id_prof = pm.id_prof
    INNER JOIN modalidades mo ON pm.id_modalidade = mo.id_modalidade
    GROUP BY mo.nome_modalidade, pf.nome_prof, pf.perfil_prof, pf.idade_prof, pf.salario_prof
)
SELECT Modalidade, Nome, Nivel, Idade, Salario
FROM professor
WHERE rn = 1
ORDER BY Salario DESC;