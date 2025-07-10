#22 - Formas de pagamento mais frequentes

SELECT forma_pgto AS FormaPgto,
	   COUNT(id_pagamento) AS Contagem
  FROM pagamentos
 WHERE status_pgto = 'Pago'
 GROUP BY FormaPgto
 ORDER BY Contagem DESC