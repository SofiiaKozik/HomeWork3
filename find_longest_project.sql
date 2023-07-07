with count_month AS (SELECT id, (DATE_PART('year', finish_date) - DATE_PART('year', start_date)) * 12 +
              (DATE_PART('month', finish_date) - DATE_PART('month', start_date)) month_data
                     FROM project),
     naiming AS (SELECT id, CONCAT('Project ',id) AS name
                 FROM project)

SELECT name, month_data
    FROM count_month
    JOIN naiming n ON count_month.id = n.id
    WHERE month_data = (SELECT MAX(month_data) FROM count_month);





