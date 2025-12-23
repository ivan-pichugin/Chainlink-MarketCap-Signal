![LINK](/chainlink1.png)
![LINK](/chainlink2.png)

# LINK Market Capitalization Shock Analysis (30-Minute Intervals)

## Project Description

This project analyzes **Chainlink (LINK)** price behavior in response to **significant short-term changes in market capitalization**.

The main hypothesis is that **large and abrupt market cap changes within short time intervals (30 minutes)** may act as leading indicators of short-term price movement and provide potential trade entry signals.

The project is implemented fully in **SQL** and structured as a small research-style market study.

---

## Data

**Source file:**  
`cryptocurrency.csv`

**Dataset characteristics:**
- Covers major cryptocurrencies
- Includes price and market capitalization data
- Updates approximately every **30 minutes**

---

## Scope

- **Asset:** Chainlink (LINK)
- **Period analyzed:** Last 1 month
- **Timeframe:** ~30-minute intervals

---

## Methodology

### 1️Data Filtering & Preparation
- Filtered data for **LINK only**
- Limited dataset to the most recent **30 days**
- Converted timestamps and numeric columns into formats suitable for calculations

---

### Market Capitalization Delta
To identify capital flow shocks, a delta column was calculated:

- Measures difference between consecutive market cap values
- Captures sudden inflows and outflows over 30-minute intervals

---

### Trigger Definition

A **trigger event** is defined as:

> **Market capitalization change greater than $300M within a single 30-minute interval**

**Results:**
- Total triggers detected: **6**
  - **1 positive** market cap spike
  - **5 negative** market cap drops

---

### Case Analysis (`cases.sql`)

Each trigger event was analyzed individually:
- A fixed forward-looking time window was selected after each trigger
- Price behavior was compared across all cases

---

## Key Findings

### Negative Market Cap Shocks
- In **all negative market cap events**, price continued moving downward
- Directional consistency observed across **100% of cases**
- Uncertainty remains only in:
  - Magnitude of the move
  - Optimal holding duration

### Positive Market Cap Shock
- The single positive shock resulted in an **aggressive downward price reaction**
- Suggests possible exhaustion or distribution behavior
- Indicates that positive capital inflows do not guarantee bullish continuation

---

## Visualization

- LINK price chart for the analyzed period
- Trigger points highlighted
- Helps visually confirm post-trigger price behavior

---

## Conclusion

- Large short-term market capitalization changes are **not random**
- Negative capital shocks consistently precede further downside
- Positive shocks may signal local tops rather than continuation
- Market cap delta can serve as a **leading signal**, not just a descriptive metric

---

## Future Work

- Extend analysis to other cryptocurrencies
- Test alternative thresholds ($200M, $500M)
- Optimize holding periods
- Combine market cap shocks with volatility or trend filters


