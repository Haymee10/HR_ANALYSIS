-- TRIM DATA (CATEGORICAL COLUMS)
UPDATE countries
SET country_name = TRIM(country_name);

-- RENAME COLUMN
ALTER TABLE countries
RENAME COLUMN country_name TO country;

-- ALTER TABLE
ALTER TABLE jobs
MODIFY COLUMN job_title TEXT;

-- THE USE OF CTE (common table expression) TO TAKE OUT DUPLICATES
WITH Duplicates AS  (
SELECT * , ROW_NUMBER() OVER(PARTITION BY employee_id ORDER BY employee_id) AS ROW_NUM
FROM employees)
SELECT *
FROM Duplicates
WHERE ROW_NUM >=1
; 
-- NO DUPLICATES FOUND

 UPDATE employees
 SET phone_number = 'not stated'
 WHERE phone_number IS NULL;
 
 ALTER TABLE employees ADD COLUMN `role_level` VARCHAR (30);
 
UPDATE employees
SET role_level = 'top management'
WHERE manager_id IS NULL;

UPDATE employees
SET role_level = 'staff'
WHERE manager_id IS NOT NULL;

UPDATE employees
SET manager_id = 200
WHERE manager_id IS NULL OR manager_id = '';

-- STANDARDIZATION OF DATA 
UPDATE departments
SET department_name = UPPER(department_name);

UPDATE departments
SET department_name = LOWER(department_name);
 
 UPDATE locations
 SET postal_code = 'not stated'
 WHERE postal_code IS NULL;
 
 UPDATE locations
 SET state_province = 'not stated'
 WHERE state_province IS NULL;
 
 UPDATE locations
 SET postal_code = 'Unknown'
 WHERE postal_code = 'not stated';
 
 UPDATE locations
 SET state_province = 'Unknown'
 WHERE state_province = 'not stated';
 
 UPDATE countries
 SET country = 'Hong Kong'
 WHERE country = 'HONGKONG';
 
 
 -- ANALYTICAL QUESTIONS --
 
 -- List all employees with their department names and job titles
 
 SELECT e.first_name, e.last_name, d.department_name, j.job_title
 FROM employees e
 JOIN departments d ON d.department_id = e.department_id
 JOIN jobs j ON j.job_id =e.job_id
 ORDER BY e.first_name ASC;
 
 -- Top 5 highest-paid employees and their departments 

SELECT e.first_name, e.last_name, e.salary, d.department_name
FROM employees e
JOIN departments d ON d.department_id = e.department_id
ORDER BY e.salary DESC
LIMIT 5;

-- The average, minimum, and maximum salary per department
 
 SELECT d.department_name,
 AVG(e.salary) AS AVG_salary,
 MIN(e.salary) AS MIN_salary,
 MAX(e.salary) AS MAX_salary
 FROM employees e
 JOIN departments d ON d.department_id = e.department_id
 GROUP BY d.department_name;
 
 -- Employees earning below their job's minimum salary
 
 SELECT e.first_name, e.last_name, e.salary AS actual_salary, j.min_salary AS minimum_salary
 FROM employees e
 JOIN jobs j ON j.job_id = e.job_id
 WHERE e.salary <= j.min_salary;
 
 -- Employees hired before 1995. Order them by hire date
 
 SELECT first_name, last_name, hire_date AS 'date of employment'
 FROM employees e
 WHERE hire_date < '1995-01-01'
 ORDER BY hire_date;
 
 -- Employees there per region
 
 SELECT r.region_name AS region, COUNT(e.employee_id) 
 FROM employees e
 JOIN departments d ON d.department_id = e.department_id
 JOIN locations l ON l.location_id = d.location_id
 JOIN countries c ON c.country_id = l.country_id
 JOIN regions r ON r.region_id = c.region_id
 GROUP BY 1; 
 
 -- Employees that have dependents, with how many dependents each have. Including employees with zero dependents as a bonus
 
 SELECT e.first_name, e.last_name, COUNT(d.dependent_id)
 FROM employees e
 JOIN dependents d ON d.employee_id = e.employee_id
 GROUP BY 1, 2;   
 
-- Rank employees within each department by salary
 
 SELECT e.first_name, e.last_name, e.salary, d.department_name,
RANK() OVER (PARTITION BY e.department_id ORDER BY e.salary DESC) AS salary_rank
 FROM employees e
 JOIN departments d ON d.department_id = e.department_id
 ORDER BY department_name, salary_rank;
 
 -- Which departments have an average salary exceeding $8,000? (Use a CTE.)

WITH dept_avg AS (
SELECT salary, department_id, AVG(salary) AS avg_salary
FROM employees
GROUP BY 1,2
)
SELECT department_name, avg_salary
FROM dept_avg da 
JOIN departments d ON d.department_id = da.department_id
WHERE avg_salary > '8000.00'
ORDER BY salary DESC;    

-- Classify employees as Entry-Level, Mid-Level, or Senior-Level based on their salary. Also showing the count of employees per band

SELECT first_name, last_name, salary, 
CASE WHEN salary < 5000 THEN 'Entry Level'
WHEN salary >=16000 THEN 'Senior Level'
ELSE 'Mid Level' END AS salary_level
FROM employees;

-- Employees earning above the company-wide average salary

SELECT first_name, last_name, salary
FROM employees e
WHERE salary > (
SELECT ROUND(AVG(salary), 2)
FROM employees)
ORDER BY salary DESC;


 
 