-- 14) What is the fraud count and fraud rate by state?  
-- Relevance: Quickly highlights high‑risk geographies.

SELECT 
    state,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_count,
    ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct
FROM transactions_master
GROUP BY state
ORDER BY fraud_rate_pct DESC;

