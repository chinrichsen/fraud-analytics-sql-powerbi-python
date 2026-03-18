-- 31) For each card, how many different merchants has it used?  
-- Relevance: Card “spread” across merchants can indicate potential compromise patterns.

SELECT
	cc_num,
	COUNT(DISTINCT merchant) AS num_dist_merch
FROM transactions_master
GROUP BY cc_num
ORDER BY num_dist_merch DESC

