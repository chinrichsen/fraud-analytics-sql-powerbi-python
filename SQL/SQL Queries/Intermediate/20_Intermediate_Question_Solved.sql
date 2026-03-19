-- 40) For each card, what is the fraud rate before and after a given date (e.g., midpoint of dataset)?  
-- Relevance: Simple “before/after” analysis, useful to illustrate cohort or period changes.

SELECT 
	cc_num,
	ROUND(AVG((CASE WHEN DATE(trans_date_trans_time) < '2020-01-10' THEN is_fraud END))*100,2) AS fraud_before,
	ROUND(AVG((CASE WHEN DATE(trans_date_trans_time) >= '2020-01-10' THEN is_fraud END))*100,2) AS fraud_after
FROM transactions_master
GROUP BY cc_num
ORDER BY cc_num;



