-- 30) For each card, what is the maximum number of transactions in a single day?  
-- Relevance: Captures bursty behavior; a common simple fraud rule input.

-- First we create the transaction number per day CTE

WITH daily_txn_counts AS (
    SELECT 
        cc_num,
        DATE(trans_date_trans_time) AS txn_date,
        COUNT(*) AS daily_transaction_count
    FROM transactions_master
    GROUP BY cc_num, DATE(trans_date_trans_time)
)

-- Now we calculate the max number of transaction in a single day per credit card

SELECT 
    cc_num,
    MAX(daily_transaction_count) AS max_daily_transactions
FROM daily_txn_counts
GROUP BY cc_num
ORDER BY max_daily_transactions DESC;

