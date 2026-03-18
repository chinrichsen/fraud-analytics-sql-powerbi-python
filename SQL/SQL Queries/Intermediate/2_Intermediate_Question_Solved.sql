-- 22) For each card, what is the total transaction count, total amount, and fraud rate?  
-- Relevance: Key per‑card KPIs; you’ll reuse this as a feature table in ML.

SELECT 
    cc_num,
    COUNT(*) AS transaction_count,
    ROUND(SUM(amt), 2) AS total_amount,
    SUM(is_fraud) AS fraud_count,
    ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct
FROM transactions_master
GROUP BY cc_num
ORDER BY fraud_rate_pct DESC;