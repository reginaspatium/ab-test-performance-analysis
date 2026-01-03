# A/B Test Results & Product Performance Analysis

## 📝 Project Overview
This project presents a comprehensive analysis of product performance through a series of **4 distinct A/B tests**. Each test targets a different stage of the user funnel, from account creation to the final payment step. 

*This documentation specifically details the results of **Test #1 (UI Optimization)**, with data processing and insights derived from a larger experimental dataset.*

## 🛠 Technical Stack
* **SQL (BigQuery)**: Advanced CTEs, Multiple Joins, Data Aggregation, and `UNION ALL` for data normalization.
* **Visualization**: Tableau.

* ## 📊 Analysis & Results

* **Primary Metric:** The `begin_checkout / session` rate showed a statistically significant increase of **6.66%** (rising from 8.34% to 8.90%, p = 0.00289).
* **Secondary Metric:** The conversion to sessions with orders remained stable with a non-significant uplift of **0.64%** (p = 0.26), confirming the change is safe for final sales.

### 🔍 Segment Insights
* **Desktop:** Highly positive and statistically significant results (p < 0.001).
* **Geography:** Significant growth observed in **Oceania** and Undefined channels (p < 0.02).
* **Mobile:** Neutral results with no significant difference found.
* **Tablet & Organic Search:** These segments showed a preference for the original version (Variant A). However, due to the relatively small sample size in these groups, the global positive impact outweighs these local variations.

---

## 💡 Final Recommendation
**Roll out Variant B (Larger Button) for all users.** The test successfully met the primary goal. Although specific segments like Tablet and Organic Search performed better with the original version, the significant uplift on Desktop (the primary traffic driver) and the overall positive trend justify a full rollout.

## 📊 Tableau Dashboard
[👉 View Interactive Dashboard in Tableau Public](https://public.tableau.com/app/profile/regina.dotsenko/viz/ABtests_17666617507500/ABTestingTool?publish=yes)

![Dashboard Preview](visualization/ab_test.png)
