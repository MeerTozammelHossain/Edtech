-- Dataset Creation
CREATE DATABASE edtech_abtest;
USE edtech_abtest;

-- Table Creation
CREATE TABLE user_activity (
    user_id INT,
    visit_date DATE,
    source_channel VARCHAR(50),
    device VARCHAR(20),
    gender VARCHAR(10),
    age_group VARCHAR(10),
    test_group CHAR(1),
    step VARCHAR(50),
    course_category VARCHAR(50),
    conversion BOOLEAN
);

-- Preview Data
SELECT * FROM user_activity LIMIT 10;

-- Count Total vs Unique Users
SELECT 
  COUNT(*) AS total_rows,
  COUNT(DISTINCT user_id) AS unique_users
FROM user_activity;

-- Most Popular Source Channel
SELECT 
  source_channel, 
  COUNT(DISTINCT user_id) AS users 
FROM user_activity 
GROUP BY source_channel
ORDER BY users DESC;

-- Active Age Groups
SELECT 
  age_group, 
  COUNT(DISTINCT user_id) AS users 
FROM user_activity 
GROUP BY age_group
ORDER BY users DESC;

-- Funnel Analysis: Drop-off by Step
SELECT 
  step,
  COUNT(DISTINCT user_id) AS users
FROM user_activity
GROUP BY step
ORDER BY FIELD(step, 'landing', 'course_detail', 'add_to_cart', 'checkout', 'enrolled');

-- AB Testing Overview
SELECT 
  test_group,
  COUNT(DISTINCT user_id) AS total_users,
  SUM(CASE WHEN conversion = 1 THEN 1 ELSE 0 END) AS converted,
  ROUND(SUM(CASE WHEN conversion = 1 THEN 1 ELSE 0 END) * 100.0 / COUNT(DISTINCT user_id), 2) AS conversion_rate
FROM user_activity
GROUP BY test_group;

-- Device-based Segmentation
SELECT 
  device,
  COUNT(DISTINCT user_id) AS total_users,
  SUM(conversion) AS converted,
  ROUND(100.0 * SUM(conversion) / COUNT(DISTINCT user_id), 2) AS conversion_rate
FROM user_activity
GROUP BY device
ORDER BY conversion_rate DESC;

-- Gender and Age Group Segmentation
SELECT 
  gender,
  age_group,
  COUNT(DISTINCT user_id) AS total_users,
  SUM(conversion) AS converted,
  ROUND(100.0 * SUM(conversion) / COUNT(DISTINCT user_id), 2) AS conversion_rate
FROM user_activity
GROUP BY gender, age_group
ORDER BY conversion_rate DESC;

-- Daily Conversion Trend
SELECT
  visit_date,
  COUNT(DISTINCT user_id) AS total_users,
  SUM(conversion) AS total_conversions,
  ROUND(100.0 * SUM(conversion) / COUNT(DISTINCT user_id), 2) AS conversion_rate
FROM user_activity
GROUP BY visit_date;

-- Top Performing Course Categories
SELECT
  course_category,
  COUNT(DISTINCT user_id) AS total_users,
  SUM(conversion) AS total_conversions,
  ROUND(100.0 * SUM(conversion) / COUNT(DISTINCT user_id), 2) AS conversion_rate
FROM user_activity
GROUP BY course_category
ORDER BY conversion_rate DESC;

-- Repeat Visitors
SELECT
  user_id,
  COUNT(DISTINCT visit_date) AS visit_days
FROM user_activity
GROUP BY user_id
ORDER BY visit_days DESC
LIMIT 10;
