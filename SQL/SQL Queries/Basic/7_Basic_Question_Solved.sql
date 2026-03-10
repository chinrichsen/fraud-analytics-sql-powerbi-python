-- 7) How many distinct credit cards (cc_num) exist in the dataset?  
-- Relevance: Shows portfolio size and helps in later per‑card analysis

SELECT 
	COUNT(DISTINCT cc_num) as num_unique_cc_num
FROM transactions_master;