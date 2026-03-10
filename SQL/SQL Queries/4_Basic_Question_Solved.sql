-- 4) What is the total transaction amount and total fraud amount?  
-- Relevance: Connects transaction volume to monetary risk and fraud loss.

SELECT 
    COUNT(*) AS total_transactions,
    ROUND(SUM(amt), 2) AS total_transaction_amount,
    ROUND(SUM(amt * is_fraud), 2) AS total_fraud_amount,
    ROUND(100.0 * SUM(amt * is_fraud) / SUM(amt), 4) AS fraud_amount_pct
FROM transactions_master;