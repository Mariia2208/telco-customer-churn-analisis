# 📊 Telco Customer Churn Analysis

## 📌 Project Overview

This is my first end-to-end data analysis project, completed after finishing courses in PostgreSQL, Excel, and Tableau.
I chose the Telco Customer Churn dataset because it reflects a real business problem — understanding why customers leave and what it costs the company.

The goal was not just to find who churned, but to understand **why**, and translate findings into **actionable business recommendations**.

**Tools used:** PostgreSQL · Excel · Tableau
**Dataset:** [IBM Telco Customer Churn — Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)
**Dashboard:** [View on Tableau Public](https://public.tableau.com/app/profile/mariia.pron/viz/Book1_17742399211240/Dashboard1?publish=yes) 

-----

## 🧠 My Analytical Approach

Before writing any query, I defined the business questions I wanted to answer.
For each question I wrote a SQL query, validated the results, and documented my findings.

> 💡 Note: I initially explored some metrics using Excel Pivot Tables, then cross-validated all churn rates using SQL `GROUP BY` queries to ensure accuracy. This helped me understand the difference between *share of total* vs *churn rate within a group* — an important distinction for correct analysis.

-----

## 🔍 Key Business Questions

1. What is the overall churn rate?
1. Does contract type affect churn?
1. Are new customers more likely to churn?
1. Does internet service type influence churn?
1. Does payment method influence churn?
1. Does the number of services affect churn?
1. Do senior citizens churn more?
1. Does having tech support reduce churn?
1. How much monthly revenue is lost due to churn?

-----

## 📊 Key Findings

### 1. Overall Churn Rate

**26.58%** of customers have left the company — roughly 1 in 4.
This is our baseline. Every other metric is compared against this number.

-----

### 2. Contract Type — Strongest Churn Driver

Customers on **month-to-month contracts churn at 42.71%** — the single strongest predictor of churn in this dataset.
Long-term contract customers are significantly more loyal, confirming that contract flexibility comes at a retention cost.

-----

### 3. Tenure — The First Year Is Critical

Customers in their first **0–12 months churn at 47.68%** — nearly double the overall average.
This suggests that the onboarding experience and early engagement are key to long-term retention.

-----

### 4. Internet Service — Fiber Optic Surprise

**Fiber optic customers churn at 41.88%** — surprisingly high for a premium service.
This may indicate dissatisfaction with pricing or service quality, and warrants further investigation.

-----

### 5. Payment Method — Electronic Check Is a Red Flag

**Electronic check users churn at 45.29%** — the highest of all payment methods, and nearly double the rate of auto-pay customers.
Manual payment may signal lower commitment or engagement with the service.

-----

### 6. Number of Services — More Services, More Loyalty

Customers with fewer services tend to churn more.
Each additional service increases switching cost and perceived value, making the customer less likely to leave.

-----

### 7. Senior Citizens — A Vulnerable Segment

**Senior citizens churn at 41.68%** vs only **23.65%** for non-seniors — a 1.76x difference.
This segment may benefit from dedicated support or tailored retention offers.

-----

### 8. Tech Support — A Powerful Retention Tool

Customers **without tech support churn at 41.65%**, while those **with support churn at only 15.17%** — a 2.7x difference.
Tech support is not just a service add-on — it is a significant retention driver.

-----

### 9. Revenue Impact

The company loses **$139,130/month** due to churn — equivalent to **$1.67M annually**.
Reducing churn by just 5% could save approximately **$83,000 per year**.

-----

## 💡 Business Recommendations

|Priority|Recommendation |Based On |
|--------|---------------------------------------------------------------|-----------------------------|
|🔴 High |Offer discounts on annual contracts to month-to-month customers|42.71% churn rate |
|🔴 High |Improve onboarding experience in the first 12 months |47.68% early churn |
|🟡 Medium|Investigate fiber optic pricing and service quality |41.88% churn rate |
|🟡 Medium|Encourage auto-pay enrollment at sign-up |45.29% e-check churn |
|🟡 Medium|Create retention programs for senior citizens |41.68% churn rate |
|🟢 Low |Promote tech support and security add-ons |2.7x churn difference |
|🟢 Low |Bundle services to increase switching cost |Fewer services = higher churn|

-----

## 📁 Repository Structure

```
telco-churn-analysis/
│
├── README.md ← you are here
├── data/
│ └── telco_churn.csv ← source dataset from Kaggle
├── excel/
│ └── telco_churn_dataset.xlsx ← Pivot Tables and Charts
├── images/
│ └── screenshots from google sheets(Pivot Tables and Charts)
├── sql/
│ └── churn_analysis_queries.sql ← all SQL queries with comments
├── tableau/
│ └── Book1.twbx ← Tableau dashboard

```

-----

## 🛠️ Tools & Skills Demonstrated

- **PostgreSQL** — aggregations, CASE WHEN, FILTER, GROUP BY, subqueries
- **Excel** — Pivot Tables, charts, data exploration
- **Tableau** — interactive dashboard

-----

*Project by [Mariia Pron] · [www.linkedin.com/in/mariia-pron] *
