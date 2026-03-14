-- 16) What is the fraud count and fraud rate by hour of day?  
-- Relevance: Shows if fraud favors certain hours (e.g., night vs day).

SELECT 
    COUNT(*) AS total_transactions,
	SUM(is_fraud) AS fraud_count,
	ROUND(AVG(is_fraud)*100,2) AS fraud_rate,
    EXTRACT(HOUR FROM trans_date_trans_time) as hour_day
FROM transactions_master
GROUP BY hour_day
ORDER BY fraud_rate DESC;

