-- 37) For each card, what proportion of its total amount is spent at its top 3 merchants?  
-- Relevance: Measures concentration; anomalously concentrated patterns can be suspicious.

-- First, let's create the ranking table for mechants by credit card

WITH merchant_ranking AS (
    SELECT 
        cc_num,
        merchant,
        SUM(amt) AS merchant_amount,
        SUM(SUM(amt)) OVER (PARTITION BY cc_num) AS total_card_amount,
        ROW_NUMBER() OVER (
            PARTITION BY cc_num 
            ORDER BY SUM(amt) DESC
        ) AS merchant_rank
    FROM transactions_master
    GROUP BY cc_num, merchant
)

-- Now, let's calculate the proportion of the top 3 over total amount by credit card

SELECT 
    cc_num,
    SUM(CASE WHEN merchant_rank <= 3 THEN merchant_amount ELSE 0 END) AS top_3_merchant_amount,
    total_card_amount,
    ROUND(
        100.0 * SUM(CASE WHEN merchant_rank <= 3 THEN merchant_amount ELSE 0 END) 
        / total_card_amount, 
        2
    ) AS top_3_concentration_pct
FROM merchant_ranking
GROUP BY cc_num, total_card_amount
ORDER BY top_3_concentration_pct DESC;