SELECT 
    YEAR(hire_date) AS hire_year,
    COUNT(employee_id) AS employees_hired
FROM employees
GROUP BY YEAR(hire_date)
ORDER BY hire_year;

SELECT 
    CASE 
        WHEN DATEDIFF(CURDATE(), hire_date) / 365 < 2 THEN 'New Hire (0-2 years)'
        WHEN DATEDIFF(CURDATE(), hire_date) / 365 BETWEEN 2 AND 5 THEN 'Mid-Tenure (2-5 years)'
        WHEN DATEDIFF(CURDATE(), hire_date) / 365 > 5 THEN 'Experienced (5+ years)'
    END AS tenure_group,
    COUNT(*) AS number_of_employees
FROM employees
GROUP BY tenure_group
ORDER BY number_of_employees DESC;

SELECT 
    d.department_name,
    ROUND(AVG(DATEDIFF(CURDATE(), e.hire_date) / 365), 1) AS average_tenure_years
FROM employees e
JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_name
ORDER BY average_tenure_years DESC;