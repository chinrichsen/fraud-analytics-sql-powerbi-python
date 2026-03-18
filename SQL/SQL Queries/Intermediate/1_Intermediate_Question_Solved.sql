-- 21) For each card, what is the first date and last date of activity (transaction window)?  
-- Relevance: Shows card “lifetime” and signals dormant vs active cards.

SELECT 
    cc_num,
	MIN(trans_date_trans_time) AS first_time_activity,
	MAX(trans_date_trans_time) AS last_time_activity
FROM transactions_master
GROUP BY cc_num
ORDER BY cc_num DESC;
