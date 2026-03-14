-- 13) What is the number of transactions by state?  
-- Relevance: Geographic distribution of your portfolio and activity.

SELECT 
    state,
    COUNT(*) AS transaction_count
FROM transactions_master
GROUP BY state
ORDER BY transaction_count DESC;