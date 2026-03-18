-- 28) For each state, what is the total transaction amount and total fraud amount?  
-- Relevance: Geographic loss and volume view; often used for region‑level risk reporting.


SELECT
    state,
    ROUND(SUM(CASE WHEN is_fraud = 1 THEN amt END), 2) AS total_fraud_amount,
    ROUND(SUM(CASE WHEN is_fraud = 0 THEN amt END), 2) AS total_non_fraud_amount,
    ROUND(SUM(amt), 2) AS overall_total_amount
FROM transactions_master
GROUP BY state
ORDER BY total_fraud_amount DESC;

