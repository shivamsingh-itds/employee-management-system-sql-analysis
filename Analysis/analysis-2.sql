SELECT 
    rating,
    COUNT(*) AS number_of_reviews
FROM performance_reviews
GROUP BY rating
ORDER BY rating;

SELECT 
    pr.rating,
    ROUND(AVG(e.salary), 2) AS average_salary
FROM performance_reviews pr
JOIN employees e ON pr.employee_id = e.employee_id
GROUP BY pr.rating
ORDER BY pr.rating;

WITH LatestReviews AS (
    SELECT 
        employee_id,
        rating,
        review_date,
        ROW_NUMBER() OVER (PARTITION BY employee_id ORDER BY review_date DESC) as latest_rev
    FROM performance_reviews
)
SELECT 
    e.employee_id,
    e.first_name,
    e.last_name,
    e.position,
    e.salary,
    lr.rating as latest_performance_rating
FROM employees e
JOIN LatestReviews lr ON e.employee_id = lr.employee_id AND lr.latest_rev = 1
ORDER BY lr.rating DESC, e.salary DESC;

