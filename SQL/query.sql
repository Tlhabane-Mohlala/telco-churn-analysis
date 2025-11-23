-- -------------------------------------------------------------------------------------------------------------------
---This SQL analysis explores customer churn behavior using a telco-style dataset.
--The goal is to understand why customers leave, which groups are at higher risk, and what factors influence churn.
-- -------------------------------------------------------------------------------------------------------------------
-- Quick preview of the dataset
SELECT *
FROM default.churn_full_project_dataset
LIMIT 20;

-- Basic churn summary
SELECT
    COUNT(*) AS total_customers,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM default.churn_full_project_dataset;

-- Churn vs Non-Churn counts
SELECT 
    Churn,
    COUNT(*) AS total
FROM default.churn_full_project_dataset
GROUP BY Churn;

-- Churn breakdown by contract type
SELECT
    Contract,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churn_count,
    COUNT(*) AS total_customers,
    ROUND(100.0 * SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS churn_rate
FROM default.churn_full_project_dataset
GROUP BY Contract
ORDER BY churn_rate DESC;

-- Churn rate by payment method
SELECT
    PaymentMethod,
    SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS churned,
    COUNT(*) AS total_customers,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END), 3) AS churn_rate
FROM default.churn_full_project_dataset
GROUP BY PaymentMethod
ORDER BY churn_rate DESC;

-- Churn by internet service type
SELECT
    InternetService,
    ROUND(AVG(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END), 3) AS churn_rate,
    COUNT(*) AS total_customers
FROM default.churn_full_project_dataset
GROUP BY InternetService
ORDER BY churn_rate DESC;

-- Avg spending (monthly & total) for churned vs non-churned customers
SELECT
    Churn,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM default.churn_full_project_dataset
GROUP BY Churn;

-- Tenure comparison between groups
SELECT
    Churn,
    ROUND(AVG(tenure), 2) AS avg_tenure,
    MIN(tenure) AS min_tenure,
    MAX(tenure) AS max_tenure
FROM default.churn_full_project_dataset
GROUP BY Churn;

-- Identify high-risk customer segment
SELECT *
FROM default.churn_full_project_dataset
WHERE
    Contract = 'Month-to-month'
    AND PaymentMethod = 'Electronic check'
    AND tenure < 6
    AND Churn = 'Yes';

-- Simple LTV estimate
SELECT
    customerID,
    tenure,
    MonthlyCharges,
    ROUND(tenure * MonthlyCharges, 2) AS LTV
FROM default.churn_full_project_dataset
ORDER BY LTV DESC
LIMIT 20;

-- Check correlation between churn and monthly charges
SELECT
    Corr(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END, MonthlyCharges) AS churn_vs_monthly_charge_corr
FROM default.churn_full_project_dataset;
