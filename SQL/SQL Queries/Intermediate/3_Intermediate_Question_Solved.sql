-- 23) For each merchant, what is the total transaction count, fraud count, fraud rate, and total fraud amount?  
-- Relevance: Core merchant risk metrics used in monitoring.

SELECT 
    merchant,
    COUNT(*) AS transaction_count,
    SUM(is_fraud) AS fraud_count,
	ROUND(SUM(amt), 2) AS total_amount,
    ROUND(SUM(amt*is_fraud), 2) AS total_fraud_amount,
    ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct
FROM transactions_master
GROUP BY merchant
ORDER BY fraud_rate_pct DESC;