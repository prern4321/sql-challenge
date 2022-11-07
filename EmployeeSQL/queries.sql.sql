DROP TABLE IF EXISTS departments 
DROP TABLE IF EXISTS dept_emp
DROP TABLE IF EXISTS dept_manager
DROP TABLE IF EXISTS employees
DROP TABLE IF EXISTS salaries
DROP TABLE IF EXISTS titles


-- Data Analysis

-- -- Q1: List the following details of each employee: 
-- -- employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary 
FROM "Employees" AS e
JOIN "Salaries" AS s
ON e.emp_no=s.emp_no;

-- -- Q2 - List first name, last name, and hire date for employees who were hired in 1986.

SELECT	
first_name,
last_name,
hire_date
from 
"Employees" where
hire_date like '%1986%'


-- -- Q3: List the manager of each department with the following information: 
-- -- department number, department name, the manager's employee number, last name, first name.
SELECT dm.dept_no, d.dept_name, e.emp_no, e.first_name, e.last_name 
FROM "Department_Manager" as dm
INNER JOIN "Employees" as e ON dm.emp_no = e.emp_no
	INNER JOIN "Departments" as d ON d.dept_no = dm.dept_no;
-- -- ======================================================

-- -- Q4: List the department of each employee with the following information:
-- -- employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Department_Employees" as de 
INNER JOIN "Employees" as e ON de.emp_no = e.emp_no
	INNER JOIN "Departments" as d ON d.dept_no = de.dept_no;

-- -- ======================================================
-- -- Q5: List first name, last name, and sex for employees whose:
-- -- first name is "Hercules" and last names begin with "B."

SELECT * 
FROM "Employees"
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

-- -- ======================================================
-- -- Q6: List all employees in the Sales department, including their 
-- -- employee number, last name, first name, and department name.

SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Department_Employees" as de 
INNER JOIN "Employees" as e ON de.emp_no = e.emp_no
	INNER JOIN "Departments" as d ON d.dept_no = de.dept_no
	WHERE dept_name = 'Sales';
-- ======================================================

-- -- Q7: List all employees in the Sales and Development departments, including their 
-- -- employee number, last name, first name, and department name.
SELECT e.emp_no, e.first_name, e.last_name, d.dept_name
FROM "Department_Employees" as de 
INNER JOIN "Employees" as e ON de.emp_no = e.emp_no
	INNER JOIN "Departments" as d ON d.dept_no = de.dept_no
	WHERE dept_name = 'Sales' OR dept_name = 'Development';

-- -- ======================================================
-- -- List the frequency count of employee last names 
-- -- (i.e., how many employees share each last name) in descending order.

SELECT last_name, COUNT(last_name) AS "Total Employees" 
	FROM "Employees"
	Group By last_name
	ORDER By "Total Employees"  DESC;