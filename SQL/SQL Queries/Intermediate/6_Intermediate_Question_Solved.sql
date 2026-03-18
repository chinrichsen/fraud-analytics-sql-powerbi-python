-- 26) What are the top 10 cards by total fraud amount?  
-- Relevance: Shows worst‑offending cards and supports case‑prioritization thinking.

-- First option: Limit not as a parameter

SELECT 
    cc_num,
    COUNT(*) AS transaction_count,
    SUM(is_fraud) AS fraud_count,
    ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct,
    ROUND(SUM(amt), 2) AS total_amount,
    ROUND(SUM(amt * is_fraud), 2) AS fraud_amount
FROM transactions_master
GROUP BY cc_num
ORDER BY fraud_amount DESC, fraud_rate_pct DESC, fraud_count DESC
LIMIT 10;

-- Second option: Limit as a parameter

WITH params AS (
    SELECT 10::int AS top_n
),
card_stats AS (
    SELECT 
        cc_num,
        COUNT(*) AS transaction_count,
        SUM(is_fraud) AS fraud_count,
        ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct,
        ROUND(SUM(amt), 2) AS total_amount,
        ROUND(SUM(amt * is_fraud), 2) AS fraud_amount,
        ROW_NUMBER() OVER (ORDER BY SUM(amt * is_fraud) DESC, AVG(is_fraud) DESC) AS rn
    FROM transactions_master
    GROUP BY cc_num
),
ranked AS (
    SELECT cs.*, p.top_n
    FROM card_stats cs
    CROSS JOIN params p
    WHERE cs.rn <= p.top_n
)
SELECT 
    cc_num,
    transaction_count,
    fraud_count,
    fraud_rate_pct,
    total_amount,
    fraud_amount
FROM ranked
ORDER BY fraud_amount DESC;