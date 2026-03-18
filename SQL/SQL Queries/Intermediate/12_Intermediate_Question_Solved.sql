-- 32) For each merchant, how many distinct cards have transacted there?  
-- Relevance: Merchant popularity and potential exposure; useful for network‑style analysis.


SELECT
	merchant,
	COUNT(DISTINCT cc_num) AS num_dist_cc
FROM transactions_master
GROUP BY merchant
ORDER BY num_dist_cc DESC

