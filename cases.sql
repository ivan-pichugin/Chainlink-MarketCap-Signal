WITH diffs AS (
    SELECT
        "timestamp"
        , symbol
        , price_usd
        , CAST(
             regexp_replace(market_cap, '[^0-9.]', '', 'g') AS numeric
        )
        - LAG(
            CAST(regexp_replace(market_cap, '[^0-9.]', '', 'g') AS numeric)
        ) OVER (ORDER BY "timestamp") AS diff
    FROM cryptocurrency
    WHERE "timestamp" BETWEEN '2025-11-20' AND '2025-12-20'
      AND symbol = 'link'
),
outliers_with_flag AS (
    SELECT 
    	*,
        	CASE WHEN ABS(diff) > 300000000 THEN 1 ELSE 0 END AS is_outlier
    FROM diffs
),

numbered AS (
    SELECT 
    	*
        , SUM(is_outlier) OVER (ORDER BY "timestamp" ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS outlier_group
    FROM outliers_with_flag
)
SELECT 
	"timestamp"
	, symbol	
	, price_usd
	, diff
FROM (
    SELECT 
    	*,
        ROW_NUMBER() OVER (PARTITION BY outlier_group ORDER BY "timestamp") AS rn
    FROM numbered
    WHERE outlier_group > 0
) t
WHERE rn <= 44 
ORDER BY "timestamp"

