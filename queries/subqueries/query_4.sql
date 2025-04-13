/*
CoderPad sandbox schema`

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

-- Find all employees whose salary is greater than the average 
-- salary of all employees.
SELECT e.first_name from employees as e 
WHERE salary > 
(SELECT AVG(e2.salary) as average_salary 
FROM employees as e2)

-- List employees who are assigned to projects with a 
-- budget greater than 100k.
SELECT e.first_name as FirstName from employees as e 
JOIN employees_projects as ep on e.id=ep.employee_id
JOIN projects as p on ep.project_id=p.id
WHERE p.budget > 100000;

--Show the employees who work in the department with the highest salary.
SELECT e.first_name as firstName,d.name as departmentName 
FROM employees as e 
JOIN departments as d on e.department_id =d.id 
WHERE e.department_id= 
    (SELECT e2.department_id 
    FROM employees as e2 
    ORDER BY salary limit 1)

--Get a list of employees who have been assigned to more than 1 project.
SELECT count(project_id) as project_count, employee_id 
FROM employees_projects 
GROUP BY employee_id having project_count>1