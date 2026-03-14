-- 20) What is the fraud rate by customer gender?  
-- Relevance: Demonstrates demographic slicing, but also highlights fairness / bias thinking.

SELECT 
    gender,
	COUNT(*) AS total_transactions,
	SUM(is_fraud) AS fraud_count,
	ROUND(AVG(is_fraud)*100,2) AS fraud_rate
FROM transactions_master
GROUP BY gender
ORDER BY fraud_count DESC;

