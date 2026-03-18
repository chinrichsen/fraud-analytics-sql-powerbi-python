-- 29) For each category, what is the average fraud transaction amount vs average non‑fraud transaction amount?  
-- Relevance: Helps design category‑specific rules or dynamic thresholds.


SELECT
    category,
    ROUND(AVG(CASE WHEN is_fraud = 1 THEN amt END), 2) AS avg_fraud_amount,
    ROUND(AVG(CASE WHEN is_fraud = 0 THEN amt END), 2) AS avg_non_fraud_amount,
    ROUND(AVG(amt), 2) AS overall_avg_amount
FROM transactions_master
GROUP BY category
ORDER BY avg_fraud_amount DESC;

