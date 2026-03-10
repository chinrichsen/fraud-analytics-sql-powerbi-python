-- 3) What is the overall fraud rate (percentage of transactions that are fraud)?  
-- Relevance: Basic KPI every fraud analyst should know for a portfolio.

SELECT ROUND(100.0 * AVG(is_fraud), 4) AS fraud_rate_pct
FROM transactions_master;