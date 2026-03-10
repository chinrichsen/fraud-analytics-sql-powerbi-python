-- 6) What is the minimum, maximum, and average transaction amount overall?  
-- Relevance: Basic descriptive statistics to spot outliers or data issues.

SELECT 
	MIN(amt) as min_amt,
	MAX(amt) as max_amt,
	AVG(amt) as avg_amt
FROM transactions_master;