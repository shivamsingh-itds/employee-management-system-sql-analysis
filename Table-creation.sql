CREATE DATABASE IF NOT EXISTS employee_management;
USE employee_management;

-- Table 1: Departments
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    location VARCHAR(100),
    budget DECIMAL(15,2)
);

-- Table 2: Employees
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    hire_date DATE,
    department_id INT,
    position VARCHAR(100),
    salary DECIMAL(10,2),
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);

-- Table 3: Projects
CREATE TABLE projects (
    project_id INT PRIMARY KEY AUTO_INCREMENT,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE,
    budget DECIMAL(15,2),
    status ENUM('Planning', 'Active', 'Completed', 'On Hold')
);

-- Table 4: Employee_Projects (Junction table)
CREATE TABLE employee_projects (
    assignment_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    project_id INT,
    role VARCHAR(100),
    hours_assigned INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (project_id) REFERENCES projects(project_id)
);

-- Table 5: Performance_Reviews
CREATE TABLE performance_reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    review_date DATE,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comments TEXT,
    reviewer_id INT,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id),
    FOREIGN KEY (reviewer_id) REFERENCES employees(employee_id)
);

-- Table 6: Salary_History
CREATE TABLE salary_history (
    salary_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    effective_date DATE,
    salary DECIMAL(10,2),
    change_reason VARCHAR(200),
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);