-- 34) For each city, what is the fraud rate and total fraud amount?  
-- Relevance: Finer‑grain geo risk than state, useful for more targeted insights.

SELECT
	city,
	COUNT(*) AS total_trans,
	SUM(is_fraud) AS fraud_trans,
	ROUND(AVG(is_fraud)*100,2) AS fraud_rate,
	ROUND(SUM(is_fraud*amt),2) AS fraud_amount
FROM transactions_master
GROUP BY city
ORDER BY fraud_rate DESC, fraud_trans DESC



