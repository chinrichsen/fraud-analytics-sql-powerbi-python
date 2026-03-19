-- 38) For each merchant, what proportion of its transactions are from its top 5 cards?  
-- Relevance: Detects merchants heavily dependent on a few cards, which can be risky.

-- First, let's create the ranking table for credit card by merchants

WITH cc_ranking AS (
    SELECT 
        merchant,
		cc_num,
        SUM(amt) AS cc_amount,
        SUM(SUM(amt)) OVER (PARTITION BY merchant) AS total_card_amount,
        ROW_NUMBER() OVER (
            PARTITION BY merchant 
            ORDER BY SUM(amt) DESC
        ) AS cc_rank
    FROM transactions_master
    GROUP BY merchant, cc_num
)

-- Now, let's calculate the proportion of the top 5 over total amount by merchant

SELECT 
    merchant,
    SUM(CASE WHEN cc_rank <= 5 THEN cc_amount ELSE 0 END) AS top_5_cc_amount,
    total_card_amount,
    ROUND(
        100.0 * SUM(CASE WHEN cc_rank <= 5 THEN cc_amount ELSE 0 END) 
        / total_card_amount, 
        2
    ) AS top_5_concentration_pct
FROM cc_ranking
GROUP BY merchant, total_card_amount
ORDER BY top_5_concentration_pct DESC;