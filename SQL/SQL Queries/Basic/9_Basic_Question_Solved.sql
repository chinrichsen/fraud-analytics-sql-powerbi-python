-- 9) How many transactions per year or per month?  
-- Relevance: Basic time‑distribution sanity check and seasonality starting point.

WITH trans_date_data AS (
    SELECT 
        EXTRACT(YEAR FROM trans_date_trans_time) AS txn_year,
        TO_CHAR(trans_date_trans_time, 'YYYY-MM') AS txn_year_month
    FROM transactions_master
)

-- Per year
SELECT 
    txn_year,
    COUNT(*) AS transactions_per_year
FROM trans_date_data
GROUP BY txn_year
ORDER BY txn_year;

-- Per month  
SELECT 
    txn_year_month,
    COUNT(*) AS transactions_per_month
FROM trans_date_data
GROUP BY txn_year_month
ORDER BY txn_year_month;