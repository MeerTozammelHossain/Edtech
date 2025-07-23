
# EdTech A/B Test Analysis Project

This project explores user behavior and conversion patterns on an EdTech platform using SQL-based analysis of A/B testing data. It aims to uncover insights into user engagement, conversion optimization, and marketing performance.

---

## 📁 Project Structure

- `EdTechproject.sql` – SQL script containing all queries and database structure.
- `user_activity.csv` – Raw dataset containing user interaction data.
- `README.md` – Project documentation and description.
- `screenshots/` – Folder with output screenshots (if applicable).

---

## 📊 Dataset Information

The dataset includes user activity logs with the following key fields:

- `user_id` – Unique identifier for users  
- `visit_date` – Date of platform visit  
- `source` – User acquisition source (email, social media, etc.)  
- `device` – Device used (mobile, desktop, tablet)  
- `age_group` – Age category  
- `gender` – Gender  
- `course_category` – Course type browsed  
- `page_visited` – Page the user visited (landing, course detail, etc.)  
- `conversion` – Binary flag indicating whether user converted  
- `test_group` – A/B test group (A or B)

---

## 🎯 SQL Objectives

This project includes:

### 1. Data Exploration
- Total records and unique users
- Daily conversion performance

### 2. Segmentation Analysis
- Source-wise conversion comparison  
- Device usage and impact on conversion  
- Age and gender-based analysis  
- Course category conversion rate

### 3. Funnel Drop-off Analysis
- Identifying steps with maximum user exit

### 4. A/B Testing Evaluation
- Conversion rate comparison between Group A and B  
- Statistical insights for decision-making

### 5. Repeat Visitor Behavior
- Detecting users with multiple visits

---

## 🛠️ Tools Used

- MySQL – Query writing and execution  
- CSV Uploader – For importing raw data into the SQL environment  
- MySQL Workbench / phpMyAdmin – GUI for database management

---

## 📌 Key Insights

- Group B (new UI/UX) had a higher conversion rate — recommended for wider rollout.
- Tablet users showed the highest conversion rate among all devices.
- Data Science courses were the most popular and had the best conversion.
- Female users aged 18–24 converted more often — strong engagement segment.
- Email campaigns work best for this key segment, while social media ads attract a broader audience.
- Most drop-offs occur before users reach course detail pages — simplify access to improve conversions*.

---

## 🚀 Getting Started

To replicate or extend this project:

1. Import `user_activity.csv` into MySQL using Workbench or phpMyAdmin.  
2. Run all queries in `EdTechproject.sql`.  
3. Customize queries for further segmentation or experimentation.

---

## 👨‍💻 Author

Meer Tozammel Hossain
Department of Statistics  
University of Dhaka  
Project Type: SQL Portfolio
Status: Completed  
