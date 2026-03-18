-- 25) Among merchants with at least N transactions, which top 10 have the highest total fraud amount?  
-- Relevance: Focuses on loss exposure rather than rate alone.

-- First option

SELECT 
    merchant,
    COUNT(*) AS transaction_count,
    SUM(is_fraud) AS fraud_count,
	ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct,
	SUM(amt) AS total_amt,
	ROUND(SUM(amt*is_fraud),2) AS fraud_amt
FROM transactions_master
GROUP BY merchant
HAVING COUNT(*) >= 500
ORDER BY fraud_amt DESC, fraud_rate_pct DESC, fraud_count DESC
LIMIT 10;


-- Second option: Declaring the variable at the beginning of the code

WITH params AS (
    SELECT 500::int AS min_txn_threshold
),
merchant_stats AS (
    SELECT 
        merchant,
        COUNT(*) AS transaction_count,
        SUM(is_fraud) AS fraud_count,
        ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct,
		SUM(amt) AS total_amt,
		ROUND(SUM(amt*is_fraud),2) AS fraud_amt
    FROM transactions_master
    GROUP BY merchant
)
SELECT 
    ms.merchant,
    ms.transaction_count,
    ms.fraud_count,
    ms.fraud_rate_pct,
	ms.total_amt,
	ms.fraud_amt
FROM merchant_stats ms
CROSS JOIN params p
WHERE ms.transaction_count >= p.min_txn_threshold
ORDER BY ms.fraud_amt DESC, ms.fraud_rate_pct DESC, ms.fraud_count DESC
LIMIT 10;

