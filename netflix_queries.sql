use netflix_customer_churn;

SELECT * FROM netflix_customer_churn;

--- Total Customers
SELECT COUNT(*) AS total_customers
FROM netflix_customer_churn;

--- Churn Count
SELECT churned, COUNT(*) AS customer_count
FROM netflix_customer_churn
GROUP BY churned;

--- Churn Rate
SELECT 
    ROUND(AVG(churned) * 100, 2) AS churn_rate_percentage
FROM netflix_customer_churn;

--- Average Watch Hours (Churn vs Active)
SELECT churned, AVG(watch_hours) AS avg_watch_hours
FROM netflix_customer_churn
GROUP BY churned;

--- Device Churn Analysis
SELECT device,
       COUNT(*) AS total_users,
       ROUND(AVG(churned) * 100,2) AS churn_rate
FROM netflix_customer_churn

---Subscription Plan Churn
SHOW COLUMNS FROM netflix_customer_churn;
SELECT subscription_type,
       COUNT(*) AS total_users,
       ROUND(AVG(churned) * 100,2) AS churn_rate
FROM netflix_customer_churn
GROUP BY subscription_type
ORDER BY churn_rate DESC;

--- Top Risk Customers
SELECT *
FROM netflix_customer_churn
WHERE watch_hours < 10
AND last_login_days > 30
AND churned = 1;