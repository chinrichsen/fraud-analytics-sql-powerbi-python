-- 8) How many distinct merchants are in the dataset?  
-- Relevance: Indicates merchant universe and potential for merchant‑level risk metrics.

SELECT 
	COUNT(DISTINCT merchant) as num_unique_merchants
FROM transactions_master;