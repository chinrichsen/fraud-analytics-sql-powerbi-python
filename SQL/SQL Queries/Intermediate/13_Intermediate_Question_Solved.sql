-- 33) For each card, what is the average time between its transactions?  
-- Relevance: Normal cadence vs spikes; basis for velocity rules.

-- First, let's create a CTE with the time between transactions

WITH TBT AS (
	SELECT 
		cc_num,
		trans_date_trans_time-LAG(trans_date_trans_time)
			OVER (PARTITION BY cc_num
			ORDER BY trans_date_trans_time) AS time_between_trans 
	FROM transactions_master
)

-- Now let's calculate thr average time between transactions for each credit card

SELECT
	cc_num, 
	AVG(time_between_trans) AS avg_time_trans 
FROM TBT
WHERE time_between_trans IS NOT NULL
GROUP BY cc_num
ORDER BY avg_time_trans ASC;

