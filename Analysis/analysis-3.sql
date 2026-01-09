SELECT 
    project_name,
    budget,
    status,
    start_date,
    end_date,
    DATEDIFF(end_date, start_date) AS duration_days
FROM projects
ORDER BY status, budget DESC;

SELECT 
    e.employee_id,
    CONCAT(e.first_name, ' ', e.last_name) AS employee_name,
    e.position,
    SUM(ep.hours_assigned) AS total_hours_assigned
FROM employees e
JOIN employee_projects ep ON e.employee_id = ep.employee_id
GROUP BY e.employee_id
ORDER BY total_hours_assigned DESC;

SELECT 
    p.project_id,
    p.project_name,
    COUNT(DISTINCT e.department_id) AS number_of_departments_involved,
    GROUP_CONCAT(DISTINCT d.department_name) AS departments
FROM projects p
JOIN employee_projects ep ON p.project_id = ep.project_id
JOIN employees e ON ep.employee_id = e.employee_id
JOIN departments d ON e.department_id = d.department_id
GROUP BY p.project_id
ORDER BY number_of_departments_involved DESC;