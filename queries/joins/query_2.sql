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
--(INNER, LEFT, RIGHT, FULL)
--INNER JOIN is same as JOIN

--List all employees along with their department names.
SELECT 
    e.first_name ,d.name 
FROM 
    employees as e 
JOIN 
    departments as d 
ON 
    e.department_id = d.id

--Retrieve a list of all employees and the projects they 
--are working on (use an INNER JOIN).

SELECT 
    e.employees,p.title 
FROM
    employees as e
JOIN
    employees_projects as ep 
ON e.id=ep.employee_id 
JOIN 
    projects as p 
ON ep.project_id=p.id


--Find all employees who are not assigned to any 
--projects (use a LEFT JOIN).

SELECT 
    e.first_name 
FROM 
    employees as e 
LEFT JOIN 
    employees_projects as ep 
ON 
    e.id=ep.employee_id 
WHERE 
    ep.project_id IS NULL


--List all projects and the employees assigned to them, 
--including projects without any employees
SELECT p.title, e.first_name
FROM projects p
LEFT JOIN employees_projects ep ON p.id = ep.project_id
LEFT JOIN employees e ON ep.employee_id = e.id;

--Show all departments and their employees 
--(including departments without employees).

SELECT d.name as department_name ,e.first_name as first_name 
FROM departments d 
LEFT JOIN employees e 
ON d.id = e.department_id