with proj_counts AS (SELECT client_id, count(client_id) cnt
                FROM project
                GROUP BY client_id
			   ),

      max_cnt AS (SELECT max(cnt) project_count
				 FROM proj_counts
				 )

SELECT name, project_count
FROM client
JOIN max_cnt m ON client.id = m.project_count
