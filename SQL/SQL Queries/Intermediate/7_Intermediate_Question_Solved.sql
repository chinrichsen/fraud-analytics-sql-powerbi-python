-- 27) For each hour of day, what is the average transaction amount for fraud vs non‑fraud?  
-- Relevance: Combines time and amount to see behavioral differences in fraud.


SELECT
    EXTRACT(HOUR FROM trans_date_trans_time) AS hour_of_day,
    ROUND(AVG(CASE WHEN is_fraud = 1 THEN amt END), 2) AS avg_fraud_amount,
    ROUND(AVG(CASE WHEN is_fraud = 0 THEN amt END), 2) AS avg_non_fraud_amount,
    ROUND(AVG(amt), 2) AS overall_avg_amount
FROM transactions_master
GROUP BY hour_of_day
ORDER BY avg_fraud_amount DESC;

