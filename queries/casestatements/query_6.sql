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

-- Create a query that categorizes employees into 
-- salary bands: low, medium, high based on salary.

SELECT first_name as firstName ,salary,
    CASE 
        WHEN salary < 20000 THEN 'Low'
        WHEN salary BETWEEN 20000 AND 50000 THEN 'Medium'
        ELSE 'High'
    END as SalaryBand
FROM employees

-- Write a query that shows employee names along with a message saying whether 
-- they are "working" or "not working" based on their assignment to a project.

SELECT e.first_name, 
  CASE 
    WHEN ep.project_id IS NOT NULL THEN 'working'
    ELSE 'not working'
  END AS work_status
from employees as e LEFT JOIN employees_projects as ep 
on e.id = ep.employee_id

-- Create a report that shows the department name along with the 
-- number of employees working in that department, using a CASE statement.

SELECT d.name as departmentName,
COUNT(CASE WHEN e.id IS NOT NULL THEN 1 END) as employeeCount
FROM departments as d LEFT JOIN employees as e
on d.id=e.department_id
GROUP by d.id