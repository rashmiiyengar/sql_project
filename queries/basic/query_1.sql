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

--(SELECT, WHERE, ORDER BY, LIMIT)

--List all employees with their first and last names.
SELECT e.first_name,e.last_name from employees AS e;

--Retrieve all employee details where the salary is greater than 50,000.
SELECT e.first_name from employees AS e WHERE salary>50000;

--Show the names of all employees and their departments, ordered by 
--salary in descending order.
SELECT e.first_name,e.salary,d.name from employees AS e JOIN departments as d
WHERE e.department_id=d.id ORDER BY e.salary DESC

--Display the top 3 highest-paid employees.
SELECT e.first_name,e.salary from employees as e ORDER BY e.salary DESC LIMIT 3

