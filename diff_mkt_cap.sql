SELECT
    "timestamp"
    , symbol
    , price_usd
    , market_cap
    , CAST(
        regexp_replace(market_cap, '[^0-9.]', '', 'g')
        AS numeric
    )
    - LAG(
        CAST(
            regexp_replace(market_cap, '[^0-9.]', '', 'g')
            AS numeric
        )
      ) OVER (ORDER BY "timestamp") AS diff
FROM cryptocurrency
WHERE "timestamp" BETWEEN '2025-11-20' AND '2025-12-20'
  AND symbol = 'link'
ORDER BY "timestamp";
