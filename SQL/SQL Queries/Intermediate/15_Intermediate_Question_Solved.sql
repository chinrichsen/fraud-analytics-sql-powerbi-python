-- 35) For each month, what is the fraud rate trend over time?  
-- Relevance: Shows whether fraud is increasing, decreasing, or stable over the period.

SELECT 
	TO_CHAR(trans_date_trans_time, 'YYYY-MM') AS month_year,
	ROUND(AVG(is_fraud)*100,2) AS fraud_rate
FROM transactions_master
GROUP BY month_year
ORDER BY month_year ASC
	





