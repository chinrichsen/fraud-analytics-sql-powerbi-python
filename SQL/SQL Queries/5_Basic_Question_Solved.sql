-- 5) What is the average transaction amount for fraud vs non‑fraud?  
-- Relevance: Helps see whether fraud tends to hit higher or lower amounts.

SELECT 
    ROUND(AVG(CASE WHEN is_fraud = 1 THEN amt END), 2) AS avg_fraud_amount,
    ROUND(AVG(CASE WHEN is_fraud = 0 THEN amt END), 2) AS avg_non_fraud_amount,
    ROUND(AVG(amt), 2) AS overall_avg_amount
FROM transactions_master;