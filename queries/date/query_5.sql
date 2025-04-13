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

-- List all employees who have been hired after 2010.
-- assuming start date in the project marks when the employee started.
SELECT e.first_name,p.start_date as startdate 
FROM employees as e 
JOIN employees_projects as ep
on e.id=ep.employee_id 
JOIN projects as p on ep.project_id = p.id
WHERE start_date > '2010-12-31'

-- USING DATE FUNCTIONS
SELECT e.first_name,p.start_date as startdate 
FROM employees as e 
JOIN employees_projects as ep
on e.id=ep.employee_id 
JOIN projects as p on ep.project_id = p.id
WHERE YEAR(startdate) > 2010

-- Find the duration of each project in days (use DATEDIFF() or similar)

