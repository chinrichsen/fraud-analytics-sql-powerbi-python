-- 11) What is the fraud count and fraud rate by category?  
-- Relevance: Identifies which categories are fraud‑heavy and may need stricter controls.

SELECT 
    category,
    SUM(CASE WHEN is_fraud = 1 THEN 1 END) AS fraud_count,
    COUNT(*) AS total_transactions,
    ROUND(100.0 * AVG(is_fraud), 2) AS fraud_rate_pct
FROM transactions_master
GROUP BY category
ORDER BY fraud_rate_pct DESC;