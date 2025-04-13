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
SELECT title ,start_date ,end_date ,DATEDIFF(end_date,start_date) as durationOfdays
FROM projects as p

-- Show all employees who were hired within the last 15 Year.
SELECT distinct e.first_name from employees as e 
JOIN employees_projects as ep on e.id=ep.employee_id
JOIN projects as p on ep.project_id =p.id
WHERE p.start_date >= CURRDATE() - INTERVAL 6 MONTH

-- Get all projects that started in 2011.
select * from projects where YEAR(start_date) = 2011