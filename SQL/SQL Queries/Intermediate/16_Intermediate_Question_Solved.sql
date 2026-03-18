-- 36) What is the fraud rate for transactions above certain amount thresholds (e.g., >100, >500, >1,000)?  
-- Relevance: Classic cut analysis to understand risk by ticket size.

-- First, let's find a solution without setting the threshold as a parameter

SELECT 
	ROUND(AVG(is_fraud)*100,2) AS fraud_rate
FROM transactions_master
WHERE amt >1000

-- Now, let's find a solution with the threshold as a parameter

WITH thresholds AS (
    SELECT unnest(ARRAY[100, 250, 500, 750, 1000, 1250, 1500]::numeric[]) AS threshold
)
SELECT 
    t.threshold,
    COUNT(*) AS transactions_above_threshold,
    SUM(is_fraud) AS fraud_count_above_threshold,
    ROUND(AVG(is_fraud) * 100, 2) AS fraud_rate_pct
FROM transactions_master tm
CROSS JOIN thresholds t
WHERE tm.amt > t.threshold
GROUP BY t.threshold
ORDER BY t.threshold;