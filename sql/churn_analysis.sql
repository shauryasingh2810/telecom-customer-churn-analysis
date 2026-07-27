/* =========================================================
   TELECOM CUSTOMER CHURN ANALYSIS
   Tools: SQL Server
   Dataset: Iranian Telecom Churn Dataset
   Customers: 3,150
   ========================================================= */

USE telecom_churn_project;
GO


/* =========================================================
   1. DATA VALIDATION
   ========================================================= */

-- Total customers
SELECT COUNT(*) AS total_customers
FROM telecom_churn;

-- Unique customers
SELECT COUNT(DISTINCT customer_id) AS unique_customers
FROM telecom_churn;

-- Preview data
SELECT TOP 10 *
FROM telecom_churn;


/* =========================================================
   2. OVERALL CHURN
   ========================================================= */

-- Churned customers
SELECT COUNT(*) AS churned_customers
FROM telecom_churn
WHERE churn = 1;

-- Retained customers
SELECT COUNT(*) AS retained_customers
FROM telecom_churn
WHERE churn = 0;

-- Overall churn rate
SELECT
    ROUND(AVG(CAST(churn AS FLOAT)) * 100, 2) AS churn_rate
FROM telecom_churn;


/* =========================================================
   3. COMPLAINTS VS CHURN
   ========================================================= */

SELECT
    complaints,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY complaints;


/* =========================================================
   4. STATUS VS CHURN
   ========================================================= */

SELECT
    status,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY status;


/* =========================================================
   5. TARIFF PLAN VS CHURN
   ========================================================= */

SELECT
    tariff_plan,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY tariff_plan;


/* =========================================================
   6. AGE GROUP VS CHURN
   ========================================================= */

SELECT
    age_group,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY age_group
ORDER BY churn_rate DESC;


/* =========================================================
   7. SUBSCRIPTION LENGTH VS CHURN
   ========================================================= */

SELECT
    CASE
        WHEN subscription_length <= 12 THEN '0-12 Months'
        WHEN subscription_length <= 24 THEN '13-24 Months'
        WHEN subscription_length <= 36 THEN '25-36 Months'
        ELSE '37+ Months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY
    CASE
        WHEN subscription_length <= 12 THEN '0-12 Months'
        WHEN subscription_length <= 24 THEN '13-24 Months'
        WHEN subscription_length <= 36 THEN '25-36 Months'
        ELSE '37+ Months'
    END
ORDER BY churn_rate DESC;


/* =========================================================
   8. CALL FAILURES VS CHURN
   ========================================================= */

SELECT
    CASE
        WHEN call_failures = 0 THEN '0'
        WHEN call_failures BETWEEN 1 AND 5 THEN '1-5'
        WHEN call_failures BETWEEN 6 AND 10 THEN '6-10'
        WHEN call_failures BETWEEN 11 AND 20 THEN '11-20'
        ELSE '21+'
    END AS call_failure_group,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY
    CASE
        WHEN call_failures = 0 THEN '0'
        WHEN call_failures BETWEEN 1 AND 5 THEN '1-5'
        WHEN call_failures BETWEEN 6 AND 10 THEN '6-10'
        WHEN call_failures BETWEEN 11 AND 20 THEN '11-20'
        ELSE '21+'
    END
ORDER BY churn_rate DESC;


/* =========================================================
   9. FREQUENCY OF USE VS CHURN
   ========================================================= */

SELECT
    CASE
        WHEN frequency_of_use <= 25 THEN 'Low'
        WHEN frequency_of_use <= 75 THEN 'Medium'
        WHEN frequency_of_use <= 150 THEN 'High'
        ELSE 'Very High'
    END AS usage_group,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY
    CASE
        WHEN frequency_of_use <= 25 THEN 'Low'
        WHEN frequency_of_use <= 75 THEN 'Medium'
        WHEN frequency_of_use <= 150 THEN 'High'
        ELSE 'Very High'
    END
ORDER BY churn_rate DESC;


/* =========================================================
   10. SMS USAGE VS CHURN
   ========================================================= */

SELECT
    CASE
        WHEN frequency_of_sms = 0 THEN 'No SMS'
        WHEN frequency_of_sms BETWEEN 1 AND 50 THEN 'Low'
        WHEN frequency_of_sms BETWEEN 51 AND 200 THEN 'Medium'
        ELSE 'High'
    END AS sms_group,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY
    CASE
        WHEN frequency_of_sms = 0 THEN 'No SMS'
        WHEN frequency_of_sms BETWEEN 1 AND 50 THEN 'Low'
        WHEN frequency_of_sms BETWEEN 51 AND 200 THEN 'Medium'
        ELSE 'High'
    END
ORDER BY churn_rate DESC;


/* =========================================================
   11. DISTINCT CALLED NUMBERS VS CHURN
   ========================================================= */

SELECT
    CASE
        WHEN distinct_called_numbers <= 10 THEN 'Low'
        WHEN distinct_called_numbers <= 30 THEN 'Medium'
        WHEN distinct_called_numbers <= 60 THEN 'High'
        ELSE 'Very High'
    END AS contact_group,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY
    CASE
        WHEN distinct_called_numbers <= 10 THEN 'Low'
        WHEN distinct_called_numbers <= 30 THEN 'Medium'
        WHEN distinct_called_numbers <= 60 THEN 'High'
        ELSE 'Very High'
    END
ORDER BY churn_rate DESC;


/* =========================================================
   12. CHARGE AMOUNT VS CHURN
   ========================================================= */

SELECT
    charge_amount,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY charge_amount
ORDER BY churn_rate DESC;


/* =========================================================
   13. SECONDS OF USE VS CHURN
   ========================================================= */

SELECT
    CASE
        WHEN seconds_of_use <= 1000 THEN 'Low'
        WHEN seconds_of_use <= 3000 THEN 'Medium'
        WHEN seconds_of_use <= 6000 THEN 'High'
        ELSE 'Very High'
    END AS usage_time_group,
    COUNT(*) AS total_customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate
FROM telecom_churn
GROUP BY
    CASE
        WHEN seconds_of_use <= 1000 THEN 'Low'
        WHEN seconds_of_use <= 3000 THEN 'Medium'
        WHEN seconds_of_use <= 6000 THEN 'High'
        ELSE 'Very High'
    END
ORDER BY churn_rate DESC;


/* =========================================================
   14. HIGH-RISK CUSTOMER COMBINATIONS
   ========================================================= */

-- Inactive + Complaint
SELECT
    COUNT(*) AS customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(100.0 * SUM(CAST(churn AS INT)) / COUNT(*), 2) AS churn_rate
FROM telecom_churn
WHERE status = 'Inactive'
AND complaints = 1;


-- Inactive + Low Usage
SELECT
    COUNT(*) AS customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(100.0 * SUM(CAST(churn AS INT)) / COUNT(*), 2) AS churn_rate
FROM telecom_churn
WHERE status = 'Inactive'
AND frequency_of_use <= 25;


-- Complaint + Low Usage
SELECT
    COUNT(*) AS customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(100.0 * SUM(CAST(churn AS INT)) / COUNT(*), 2) AS churn_rate
FROM telecom_churn
WHERE complaints = 1
AND frequency_of_use <= 25;


-- New Customer + Low Usage
SELECT
    COUNT(*) AS customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(100.0 * SUM(CAST(churn AS INT)) / COUNT(*), 2) AS churn_rate
FROM telecom_churn
WHERE subscription_length <= 12
AND frequency_of_use <= 25;


-- Complaint + New Customer
SELECT
    COUNT(*) AS customers,
    SUM(CAST(churn AS INT)) AS churned_customers,
    ROUND(100.0 * SUM(CAST(churn AS INT)) / COUNT(*), 2) AS churn_rate
FROM telecom_churn
WHERE complaints = 1
AND subscription_length <= 12;


/* =========================================================
   15. FINAL CUSTOMER RISK SEGMENTATION
   ========================================================= */

SELECT
    CASE
        WHEN complaints = 1
             AND (
                 status = 'Inactive'
                 OR frequency_of_use <= 25
                 OR subscription_length <= 12
             )
            THEN 'High Risk'

        WHEN status = 'Inactive'
             OR frequency_of_use <= 25
             OR subscription_length <= 12
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS risk_segment,

    COUNT(*) AS customers,
    SUM(CAST(churn AS INT)) AS churned_customers,

    ROUND(
        100.0 * SUM(CAST(churn AS INT)) / COUNT(*),
        2
    ) AS churn_rate

FROM telecom_churn

GROUP BY
    CASE
        WHEN complaints = 1
             AND (
                 status = 'Inactive'
                 OR frequency_of_use <= 25
                 OR subscription_length <= 12
             )
            THEN 'High Risk'

        WHEN status = 'Inactive'
             OR frequency_of_use <= 25
             OR subscription_length <= 12
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END

ORDER BY churn_rate DESC;


/* =========================================================
   16. TABLEAU ANALYSIS VIEW
   ========================================================= */

GO

CREATE OR ALTER VIEW churn_customer_analysis AS

SELECT *,
    CASE
        WHEN complaints = 1
             AND (
                 status = 'Inactive'
                 OR frequency_of_use <= 25
                 OR subscription_length <= 12
             )
            THEN 'High Risk'

        WHEN status = 'Inactive'
             OR frequency_of_use <= 25
             OR subscription_length <= 12
            THEN 'Medium Risk'

        ELSE 'Low Risk'
    END AS risk_segment

FROM telecom_churn;

GO


-- Verify Tableau view
SELECT TOP 10 *
FROM churn_customer_analysis;