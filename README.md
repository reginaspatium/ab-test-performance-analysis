# A/B Test Results & Product Performance Analysis (SQL + Python + Tableau)

## 📝 Project Overview
This project presents a comprehensive analysis of product performance through a series of 4 distinct A/B tests. The core focus is on Test #1 (UI Optimization), analyzing its impact on the user funnel from account creation to the final payment step.

Initially designed as a SQL + Tableau project, it has been fully refactored to include a Python-based statistical engine, ensuring robust validation of results using automated Z-tests across multiple segments.

## 🛠 Technical Stack
* **SQL (BigQuery)**: Advanced CTEs, Multiple Joins, and UNION ALL for complex data normalization and retrieval.
* **Python (Pandas, Statsmodels)**: Automated data processing and implementation of Two-Sample Z-Tests for proportions.
* **Visualization**: Tableau (Interactive Dashboards).

## 🧬 Analysis Methodology (Python Integration)
To make the analysis more rigorous, a Python script was integrated to:Automate Aggregation: Group data by Test Number, Metric, Continent, and Device.Statistical Validation: Calculate Z-scores and P-values using statsmodels.stats.proportion.Significance Labeling: Automatically classify results as Significant Growth, Significant Drop, or Statistical Noise based on a 95% confidence level (|Z| > 1.96).

* ## 📊 Key Results (Test #1)
Based on the Python-processed dataset, Test #1 showed strong positive momentum:
* **Payment Info Conversion (add_payment_info)**: Achieved a highly significant growth of +12.54% (Z = 3.9249, p < 0.001).
* **Checkout Process (begin_checkout)**: Statistically significant increase of +6.66% (Z = 2.9788, p = 0.0029).
* **Shipping Info (add_shipping_info)**: Significant growth of +6.56% (Z = 2.6036).
* **New Accounts**: Showed a slight decrease of -3.35%, but with Z = -1.5429, this result is not statistically significant and is treated as statistical noise.

### 🔍 Segment Insights
* **Desktop:** Highly positive and statistically significant results (p < 0.001).
* **Geography:** Significant growth observed in **Oceania** and Undefined channels (p < 0.02).
* **Mobile:** Neutral results with no significant difference found.
* **Tablet & Organic Search:** These segments showed a preference for the original version (Variant A). However, due to the relatively small sample size in these groups, the global positive impact outweighs these local variations.

---

## 💡 Final Recommendation
**Roll out Variant B (Larger Button) for all users.** The test successfully met the primary goal. Although specific segments like Tablet and Organic Search performed better with the original version, the significant uplift on Desktop (the primary traffic driver) and the overall positive trend justify a full rollout.

## 📊 Tableau Dashboard
[👉 View Interactive Dashboard in Tableau Public](https://public.tableau.com/views/A_Btests/ABTestingTool?:language=en-US&:sid=&:redirect=auth&:display_count=n&:origin=viz_share_link)

![Dashboard Preview](viz/A_B%20Testing%20Tool.png)
