-- 39) For each card, how many days had more than X transactions (e.g., >10)?  
-- Relevance: Identifies repeated high‑velocity days; signals potential ongoing abuse.

-- First, let's create a table with the amount of transactions by date per credit card

WITH days_count AS (
	SELECT cc_num, DATE(trans_date_trans_time) AS Days, COUNT(*) AS trans_count 
	FROM transactions_master
	GROUP BY cc_num, Days
	ORDER BY cc_num, Days ASC, trans_count DESC
)

-- Now let's calculate the number of days with more than X transactions (in this case, 10)

SELECT cc_num, COUNT(Days) AS days_total
FROM days_count
WHERE trans_count > 10
GROUP BY cc_num
ORDER BY days_total DESC 


