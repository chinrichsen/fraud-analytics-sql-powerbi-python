-- 1) What is the total number of transactions in the dataset?  
-- Relevance: Shows overall data volume and that you can do simple counts (sanity check and data profiling).

SELECT 
    COUNT(*) AS total_transactions,
    COUNT(DISTINCT cc_num) AS unique_cards,
    MIN(trans_date_trans_time) AS first_transaction,
    MAX(trans_date_trans_time) AS last_transaction,
	ROUND(MIN(amt), 2) AS min_amount,
	ROUND(MAX(amt), 2) AS max_amount,
    ROUND(AVG(amt), 2) AS avg_amount,
	ROUND(STDDEV_SAMP(amt), 2) AS std_amount
FROM transactions_master;