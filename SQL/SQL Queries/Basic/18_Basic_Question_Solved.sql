-- 18) For each card, how many transactions and how many frauds occurred?  
-- Relevance: Lets you see “problem cards” and is the basis for per‑card risk features.

SELECT 
    cc_num,
	COUNT(*) AS total_transactions,
	SUM(is_fraud) AS fraud_count
FROM transactions_master
GROUP BY cc_num
ORDER BY fraud_count DESC;

