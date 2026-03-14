-- 15) What is the number of transactions by hour of day?  
-- Relevance: Time‑of‑day usage pattern; fraud often spikes at off‑hours.

SELECT 
    COUNT(*) AS total_transactions,
    EXTRACT(HOUR FROM trans_date_trans_time) as hour_day
FROM transactions_master
GROUP BY hour_day
ORDER BY total_transactions DESC;

