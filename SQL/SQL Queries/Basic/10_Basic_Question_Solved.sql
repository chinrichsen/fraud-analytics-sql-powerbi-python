-- 10) What is the count of transactions by transaction category (e.g., groceries, gas, etc.)?  
-- Relevance: Understands spending mix; later useful for category‑specific fraud patterns.

SELECT 
	COUNT(*) as trans_num, category
FROM transactions_master
GROUP BY category
ORDER BY trans_num DESC


