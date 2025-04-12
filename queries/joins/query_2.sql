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
