-- 19) What is the distribution of transactions by customer gender?  
-- Relevance: Simple demographic slice; mostly for understanding data, not for rules.

SELECT 
    gender,
	COUNT(*) AS total_transactions,
	SUM(is_fraud) AS fraud_count,
	ROUND(AVG(is_fraud)*100,2) AS fraud_rate
FROM transactions_master
GROUP BY gender
ORDER BY fraud_count DESC;

