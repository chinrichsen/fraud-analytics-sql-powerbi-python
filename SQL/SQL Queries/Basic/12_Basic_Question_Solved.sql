-- 12) What is the average transaction amount by category?  
-- Relevance: Provides typical ticket sizes and informs threshold rules.

SELECT 
    category,
    ROUND(AVG(amt), 2) AS avg_transaction_amount
FROM transactions_master
GROUP BY category
ORDER BY avg_transaction_amount DESC;