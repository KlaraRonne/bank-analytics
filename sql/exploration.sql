
-- BANK MARKETING EXPLORATION QUERIES


-- 1. Count of responses
SELECT y, COUNT(*) AS n_customers
FROM clients
GROUP BY y;

-- 2. Average age and call duration by response
SELECT 
    y,
    ROUND(AVG(age),1) AS avg_age,
    ROUND(AVG(duration),1) AS avg_duration,
    COUNT(*) AS n
FROM clients
GROUP BY y;

-- 3. Yes rate by job
SELECT 
    job,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS yes_percent,
    COUNT(*) AS total_customers
FROM clients
GROUP BY job
ORDER BY yes_percent DESC;

-- 4. Yes rate by age group
SELECT 
    age_group,
    SUM(CASE WHEN y='yes' THEN 1 ELSE 0 END)*100.0/COUNT(*) AS yes_percent,
    COUNT(*) AS total_customers
FROM clients
GROUP BY age_group
ORDER BY yes_percent DESC;
