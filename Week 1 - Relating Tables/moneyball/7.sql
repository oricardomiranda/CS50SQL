SELECT p.first_name, p.last_name
FROM players p
JOIN (
    SELECT player_id, MAX(salary) AS max_salary
    FROM salaries
) s ON p.id = s.player_id
