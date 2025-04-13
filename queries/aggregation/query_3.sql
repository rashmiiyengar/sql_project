/*
CoderPad sanbox schema`

employees                             projects
+---------------+---------+           +---------------+---------+
| id            | int     |<----+  +->| id            | int     |
| first_name    | varchar |     |  |  | title         | varchar |
| last_name     | varchar |     |  |  | start_date    | date    |
| salary        | int     |     |  |  | end_date      | date    |
| department_id | int     |--+  |  |  | budget        | int     |
+---------------+---------+  |  |  |  +---------------+---------+
                             |  |  |
departments                  |  |  |  employees_projects
+---------------+---------+  |  |  |  +---------------+---------+
| id            | int     |<-+  |  +--| project_id    | int     |
| name          | varchar |     +-----| employee_id   | int     |
+---------------+---------+           +---------------+---------+
*/

-- How many employees are in each department? (GROUP BY + COUNT)
SELECT count(*) , d.name as department_name 
FROM employees as e 
JOIN departments as d on e.department_id=d.id 
GROUP BY department_name

-- What is the total salary expense of all employees?
SELECT sum(salary) as total_salary_expense 
FROM employees as e

-- Find the average salary of employees in each department.
SELECT round(avg(e.salary)) 
as average_salary,d.name as depaertment_name
FROM employees as e 
JOIN departments as d
ON e.department_id = d.id
GROUP BY depaertment_name

-- What is the highest salary in the company?
SELECT max(e.salary) as highest_salary 
FROM employees as e 

-- What is the lowest budget of any project?
SELECT MIN(p.budget) as lowest_budget from projects as p

