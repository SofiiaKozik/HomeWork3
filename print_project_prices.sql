with count_month AS (SELECT id, (DATE_PART('year', finish_date) - DATE_PART('year', start_date)) * 12 +
              (DATE_PART('month', finish_date) - DATE_PART('month', start_date)) month_data
                     FROM project),
     naiming AS (SELECT id, CONCAT('Project ',id) AS name
                 FROM project),
     mont_workers_salary as (SELECT worker_id, project_id, salary
            FROM project_worker
            FULL JOIN worker w ON worker_id = w.id)

select name, ((select sum(salary) from mont_workers_salary where project_id = count_month.id) * month_data) as price
from count_month
JOIN naiming n ON count_month.id = n.id
ORDER BY price DESC










