
 --1) What is the overal churn rate?
SELECT ROUND(COUNT(*) 
FILTER (WHERE churn = 'Yes')*100.0/COUNT(*),2)AS churn_perc
FROM telco_churn;
-- Insight: The overal churn rate is approximately 26.58%, meaning about one in four customers has left the service.

--2)Does contract type affect churn?
SELECT contract, COUNT(churn) AS churned_customer
FROM telco_churn
WHERE churn = 'Yes'
GROUP BY contract;
 --Insight: Customer with month-to-month contracts churn the most.That shows that the customer in short terms contract are more risky for the business.

--3)Are new customers more likely to churn?
SELECT 
 CASE
  WHEN tenure <=12 THEN '0-12 months'
	WHEN tenure <=24 THEN '12-24 months'
	WHEN tenure <=48 THEN '24-48 months'
	ELSE '48 months'
 END AS tenure_group	,
COUNT(churn)AS churned_customers
FROM telco_churn
WHERE churn = 'Yes'
GROUP BY tenure_group
ORDER BY tenure_group;
--Insight: Customers <= 0-12 monthsbhave the highest churn, confirming that new customers are more likely to leave the company.

--4)Does internet service type influence churn?
SELECT internetservice, COUNT(churn) AS churned_customers
FROM telco_churn
WHERE churn = 'Yes'
GROUP BY internetservice;
--Insight: Customers with Fiber Optic internet churn the most,indicating that this segment is at higher risk and may need additional retention strategies.

--5)Does payment method influence churn?
SELECT paymentmethod, COUNT(churn)
FROM telco_churn
WHERE churn = 'Yes'
GROUP BY paymentmethod;
--Insight: Customers who pay month-to-month or use electronic check are more likely to churn, while customers with bank transfer or credit card payment methods tend to stay longer.

--6)Does the number of service affect churn?
SELECT  COUNT(churn) AS churn_count, 
 (CASE WHEN phoneservice = 'Yes' THEN 1 ELSE 0 END + 
 CASE WHEN multiplelines = 'Yes' THEN 1 ELSE 0 END + 
 CASE WHEN onlinesecurity = 'Yes' THEN 1 ELSE 0 END + 
 CASE WHEN onlinebackup = 'Yes' THEN 1 ELSE 0 END + 
 CASE WHEN deviceprotection = 'Yes' THEN 1 ELSE 0 END + 
 CASE WHEN techsupport = 'Yes' THEN 1 ELSE 0 END + 
 CASE WHEN streamingtv = 'Yes' THEN 1 ELSE 0 END + 
 CASE WHEN streamingmovies = 'Yes' THEN 1 ELSE 0 END ) AS services_count 
FROM telco_churn
WHERE churn = 'Yes'
GROUP BY services_count
ORDER BY churn_count DESC;
--Insight: Customers with fewer services tend to churn more, suggesting that offering additional services may help improve retention.

--7)Which customer segment has the highest churn rate?
SELECT contract,internetservice,
  CASE 
    WHEN tenure <= 12 THEN '0-12 months'
    ELSE '12+ months'
    END AS tenure_group,
  COUNT(*) AS churned_customers
FROM telco_churn
WHERE churn = 'Yes'
GROUP BY contract, internetservice, tenure_group
ORDER BY churned_customers DESC;
--Insight: Customers who have month-to-month contracts, fiber optic internet and tenure <12 months shows the highest churn risk of leaving the company.