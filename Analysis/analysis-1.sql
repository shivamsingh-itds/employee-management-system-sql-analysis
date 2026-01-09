use employee_management;

SELECT 
    d.department_name,
    COUNT(e.employee_id) AS number_of_employees,
    d.budget AS total_budget,
    ROUND(d.budget / COUNT(e.employee_id), 2) AS budget_per_employee
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id
ORDER BY number_of_employees DESC;

SELECT 
    d.department_name,
    d.budget AS total_department_budget,
    SUM(e.salary) AS total_salary_expenditure,
    ROUND((SUM(e.salary) / d.budget) * 100, 2) AS salary_budget_percentage
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_id
ORDER BY salary_budget_percentage DESC;

SELECT 
    d.department_name,
    ROUND(AVG(e.salary), 2) AS average_salary,
    ROUND(AVG(DATEDIFF(CURDATE(), e.hire_date) / 365), 1) AS average_tenure_years
FROM departments d
JOIN employees e ON d.department_id = e.department_id
GROUP BY d.department_name
ORDER BY average_salary DESC;