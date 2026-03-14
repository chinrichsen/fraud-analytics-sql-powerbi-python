-- 17) For each merchant, how many transactions and how many frauds occurred?  
-- Relevance: Builds base for merchant risk ranking.

SELECT 
    merchant,
	COUNT(*) AS total_transactions,
	SUM(is_fraud) AS fraud_count
FROM transactions_master
GROUP BY merchant
ORDER BY fraud_count DESC;

