CREATE TABLE employees (
  id INT PRIMARY KEY,
  first_name VARCHAR(50),
  last_name VARCHAR(50),
  salary INT,
  department_id INT
);

INSERT INTO employees (id, first_name, last_name, salary, department_id) VALUES
(1, 'Alice', 'Johnson', 60000, 1),
(2, 'Bob', 'Smith', 75000, 1),
(3, 'Charlie', 'Brown', 50000, 2),
(4, 'Daisy', 'Williams', 80000, 3),
(5, 'Eve', 'Davis', 55000, 2);
---------------------------------------------------------------------
CREATE TABLE departments (
  id INT PRIMARY KEY,
  name VARCHAR(50)
);

INSERT INTO departments (id, name) VALUES
(1, 'Engineering'),
(2, 'Marketing'),
(3, 'Human Resources');
---------------------------------------------------------------------
CREATE TABLE projects (
  id INT PRIMARY KEY,
  title VARCHAR(100),
  start_date DATE,
  end_date DATE,
  budget INT
);

INSERT INTO projects (id, title, start_date, end_date, budget) VALUES
(1, 'Website Redesign', '2023-01-01', '2023-06-01', 100000),
(2, 'Product Launch', '2023-02-01', '2023-08-01', 75000),
(3, 'Recruitment Campaign', '2023-03-01', '2023-07-01', 50000);
---------------------------------------------------------------------------
CREATE TABLE employees_projects (
  project_id INT,
  employee_id INT,
  FOREIGN KEY (project_id) REFERENCES projects(id),
  FOREIGN KEY (employee_id) REFERENCES employees(id)
);

INSERT INTO employees_projects (project_id, employee_id) VALUES
(1, 1),
(1, 2),
(2, 3),
(3, 4);
