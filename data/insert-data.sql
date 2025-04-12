-- Example INSERT STATEMENTS
-- DEPARTMENTS
INSERT INTO departments (department_name) VALUES
('Engineering'), ('HR'), ('Finance');

-- EMPLOYEES
INSERT INTO employees (first_name, last_name, department_id, hire_date, job_title) VALUES
('Alice', 'Smith', 1, '2020-01-15', 'Software Engineer'),
('Bob', 'Johnson', 1, '2018-06-10', 'Senior Developer'),
('Carol', 'Williams', 2, '2019-03-20', 'HR Manager'),
('David', 'Brown', 3, '2021-08-01', 'Financial Analyst');

-- SALARIES
INSERT INTO salaries (employee_id, amount, from_date, to_date) VALUES
(1, 70000, '2022-01-01', '2023-01-01'),
(2, 90000, '2022-01-01', '2023-01-01'),
(3, 65000, '2022-01-01', '2023-01-01'),
(4, 72000, '2022-01-01', '2023-01-01');

-- PROJECTS
INSERT INTO projects (project_name, employee_id, start_date, end_date) VALUES
('Payroll System', 1, '2022-02-01', '2022-12-01'),
('Website Redesign', 2, '2022-03-15', '2022-11-30'),
('HR Portal', 3, '2022-04-01', '2022-10-01');
