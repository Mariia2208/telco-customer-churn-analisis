--VERSION 1 initial query counts churned customersmper group.
--VERSION 2 adds churn rate % within each group for better comparison.

 --VERSION 1 - 1) What is the overal churn rate?
SELECT ROUND(COUNT(*)
FILTER (WHERE churn = 'Yes')*100.0/COUNT(*),2)AS churn_perc
 FROM telco_churn;
--VERSION 2
SELECT
COUNT(*) AS total_customers,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
 FROM telco_churn;
-- The overal churn rate is approximately 26.58%, meaning about one in four customers has left the service.

--VERSION 1 - 2)Does contract type affect churn?
SELECT contract, COUNT(churn) AS churned_customer
 FROM telco_churn
WHERE churn = 'Yes'
GROUP BY contract;
 --VERSION 2
SELECT contract,
COUNT(*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
 FROM telco_churn
GROUP BY contract
ORDER BY churn_rate_pct DESC;
 --Month-to-month customers churn at 42.71% — 14x higher than 2-year contract customers. 

--VERSION 1 - 3)Are new customers more likely to churn?
SELECT 
 CASE
WHEN tenure <=12 THEN '0-12 months'
WHEN tenure <=24 THEN '12-24 months'
WHEN tenure <=48 THEN '24-48 months'
ELSE '48+ months'
 END AS tenure_group	,
COUNT(churn)AS churned_customers
 FROM telco_churn
WHERE churn = 'Yes'
GROUP BY tenure_group
ORDER BY tenure_group;
 --VERSION 2
SELECT
 CASE
WHEN tenure <= 12 THEN '0–12 months'
WHEN tenure <= 24 THEN '13–24 months'
WHEN tenure <= 48 THEN '25–48 months'
ELSE '49+ months'
 END AS tenure_group,
COUNT(*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
 FROM telco_churn
GROUP BY tenure_group
ORDER BY churn_rate_pct DESC;
--Nearly half of new customers (0–12 months) churn at 47.68%. The first year is the most critical.

--VERSION 1 - 4)Does internet service type influence churn?
SELECT internetservice, COUNT(churn) AS churned_customers
 FROM telco_churn
WHERE churn = 'Yes'
GROUP BY internetservice;
--VERSION 2
SELECT internetservice,
COUNT(*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
 FROM telco_churn
GROUP BY internetservice
ORDER BY churn_rate_pct DESC;
--Fiber optic customers churn at 41.89 % — surprisingly high for a premium service. This may indicate a pricing or quality satisfaction issue.

--VERSION 1 - 5)Does payment method influence churn?
SELECT paymentmethod, COUNT(churn)
 FROM telco_churn
WHERE churn = 'Yes'
GROUP BY paymentmethod;
--VERSION 2
SELECT paymentmethod,
COUNT(*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
 FROM telco_churn
GROUP BY paymentmethod
ORDER BY churn_rate_pct DESC;
--Electronic check users churn at 45.29% — nearly double the rate of auto-pay customers. Manual payment may signal lower angagement.

--VERSION 1 - 6)Does being a senior citizen affect churn?
SELECT
 CASE WHEN seniorcitizen = 1 THEN 'Senior' ELSE 'Non-Senior' END AS segment,
COUNT(churn) AS churned_customers
 FROM telco_churn
WHERE churn = 'Yes'
GROUP BY seniorcitizen;
--VERSION 2
SELECT
 CASE WHEN seniorcitizen = 1 THEN 'Senior' ELSE 'Non-Senior' END AS segment,
COUNT(*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
 FROM telco_churn
GROUP BY seniorcitizen;
--Senior citizens churn at 26.65% — significantly higher than non-seniors. This segment may need dedicated retention programs.

--VERSION 1-- 7) Does having tech support reduce churn?
SELECT techsupport, COUNT(churn) AS churned_customers
 FROM telco_churn
WHERE churn = 'Yes'
AND internetservice != 'No'
GROUP BY techsupport;
--VERSION 2
SELECT techsupport,
COUNT(*) AS total,
SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
ROUND(SUM(CASE WHEN churn = 'Yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2) AS churn_rate_pct
 FROM telco_churn
WHERE internetservice != 'No'
GROUP BY techsupport;
--Customers without tech support churn at 41.65% vs only 15.17% with support — a 2.7x difference. Tech support is a strong retention tool.


--VERSION 1-- 8) How much monthly revenue is lost due to churn?
SELECT COUNT(churn) AS churned_customers,
ROUND(SUM(monthlycharges), 2) AS monthly_revenue_lost
 FROM telco_churn
WHERE churn = 'Yes';
--VERSION 2
SELECT
COUNT(*) AS churned_customers,
ROUND(SUM(monthlycharges), 2) AS monthly_revenue_lost,
ROUND(SUM(monthlycharges) * 12, 2) AS annual_revenue_lost,
ROUND(AVG(monthlycharges), 2) AS avg_charge_per_churned_customer
 FROM telco_churn
WHERE churn = 'Yes';
--The company loses $139,130/month ($1.67M annually) due to churn. Reducing churn by just 5% would save ~$83K per year.