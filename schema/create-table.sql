--EXAMPLE CREATE STATEMENTS
-- DEPARTMENTS
CREATE TABLE departments (
    department_id INT AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(100) NOT NULL
);

-- EMPLOYEES
CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    department_id INT,
    hire_date DATE,
    job_title VARCHAR(100),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- SALARIES
CREATE TABLE salaries (
    salary_id INT AUTO_INCREMENT PRIMARY KEY,
    employee_id INT,
    amount DECIMAL(10,2),
    from_date DATE,
    to_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

-- PROJECTS
CREATE TABLE projects (
    project_id INT AUTO_INCREMENT PRIMARY KEY,
    project_name VARCHAR(150),
    employee_id INT,
    start_date DATE,
    end_date DATE,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);
