# HR_ANALYSIS
MySQL HR Analysis Case Study: Workforce structure, compensation analysis, and organizational insight.

# 📊 HR Database Analysis

![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Power BI](https://img.shields.io/badge/Visualization-PowerBI-yellow)
![SQL](https://img.shields.io/badge/Language-SQL-orange)
![Status](https://img.shields.io/badge/Project-Completed-brightgreen)

---

## 🧾 Project Overview

This project presents a comprehensive analysis of the **Human Resources (HR) Database** using **MySQL** and **Power BI**. The database, named **`HR ANALYSIS`**, contains structured HR data for employees, departments, job roles, and global locations.

The project demonstrates how SQL can be used to clean, transform, and analyze real-world organizational data to generate actionable business insights.

---

## 🎯 Objectives

* Analyze workforce distribution across departments and regions
* Evaluate salary structures and compensation patterns
* Identify high-paying roles and departments
* Examine employee–manager relationships
* Perform data cleaning and standardization
* Apply advanced SQL techniques for business analysis

---

## 🗂️ Database Schema Overview

The database contains **7 relational tables**:

### 📌 employees

* Employee personal and professional details
* Salary, hire date, job ID, department ID
* Manager relationships and hierarchy

### 📌 departments

* Department names and unique IDs
* Links to specific office locations

### 📌 jobs

* Job titles and role descriptions
* Minimum and maximum salary ranges

### 📌 locations

* Office location details
* City, state/province, and postal codes

### 📌 countries

* Country names
* Mapping to regions

### 📌 regions

* Global region classification (e.g., Americas, Europe, Asia, Middle East)

### 📌 dependents

* Employee dependents information
* Relationship mapping to employees

---

## 📊 Dataset Summary

* 👥 **40 Employees**
* 🏢 **11 Departments**
* 🌍 **25 Countries**
* 🌐 **4 Global Regions**

---

## ❓ Analytical Questions Covered

1. List all employees with their department names and job titles
2. Identify the top 5 highest-paid employees and their departments
3. Calculate the average, minimum, and maximum salary per department
4. Determine the number of direct reports for each manager
5. Find employees earning below their job's minimum salary
6. Identify employees hired before 1995 (sorted by hire date)
7. Count employees in each region
8. Analyze employees with dependents and their counts (including zero)
9. Rank employees within each department by salary
10. Identify departments with an average salary above $8,000 using CTE
11. Classify employees into Entry, Mid, and Senior salary levels
12. Find employees earning above the company-wide average salary

---

## 🧠 SQL Techniques Demonstrated

* ✅ **JOINs** (INNER JOIN, LEFT JOIN, multi-table joins)
* ✅ **Aggregations** (`SUM`, `AVG`, `COUNT`, `MIN`, `MAX`)
* ✅ **Subqueries** (nested queries for comparisons)
* ✅ **Window Functions** (`RANK`, `ROW_NUMBER`)
* ✅ **Common Table Expressions (CTEs)**
* ✅ **Conditional Logic** (`CASE WHEN`)
* ✅ **Data Cleaning & Transformation** (TRIM, UPDATE, ALTER)

---

## ⚙️ Setup & Installation

### 📌 Prerequisites

* MySQL Server installed
* MySQL Workbench (optional but recommended)

### 🚀 Steps to Run Locally

```sql
-- Create database
CREATE DATABASE hr_analysis;

-- Select database
USE hr_analysis;

-- Import SQL script (adjust file path as needed)
SOURCE HR_ANALYSIS_CLEANING_SCRIPT.sql;
```

### ▶️ Running the Analysis

1. Open MySQL Workbench or Command Line Interface
2. Load the SQL script file
3. Execute queries section by section
4. Review outputs for insights and validation

---

## 🛠️ Tools Used

* **MySQL** – Data storage, cleaning, and querying
* **Power BI** – Data visualization and dashboard reporting

---

## 🔍 Key Findings

* Salary distribution varies significantly across job roles
* A small group of employees accounts for the highest compensation
* Certain departments have notably higher average salaries
* Workforce distribution is uneven across global regions
* Salary classification highlights a clear organizational hierarchy
* Data cleaning improved consistency, accuracy, and usability

---

## 👤 Author

**Mr. Amos Aragba**
🔗 (https://linkedin.com/in/amos-aragba)

---

## ⭐ Acknowledgements

This project is part of a data analytics portfolio that demonstrates strong SQL skills, data-cleaning techniques, and business-insight generation.

