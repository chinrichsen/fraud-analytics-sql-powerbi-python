-- 2) How many transactions are labeled as fraud vs non‑fraud?  
-- Relevance: Gives fraud rate and class imbalance, which is critical context for any fraud or ML work.

SELECT 
    COUNT(*) AS total_transactions,
    SUM(CASE WHEN is_fraud = 0 THEN 1 ELSE 0 END) AS non_fraud_transactions,
    SUM(is_fraud) AS fraud_transactions,
    ROUND(100.0 * AVG(is_fraud), 4) AS fraud_rate_pct
FROM transactions_master;