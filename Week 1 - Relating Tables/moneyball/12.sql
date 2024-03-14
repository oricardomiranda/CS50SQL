SELECT
    players.first_name,
    players.last_name
FROM
    (
        SELECT
            salaries.player_id,
            salaries.salary / performances.H AS dollars_per_hit,
            salaries.salary / performances.RBI AS dollars_per_rbi,
            RANK() OVER (ORDER BY salaries.salary / performances.H) AS hit_rank,
            RANK() OVER (ORDER BY salaries.salary / performances.RBI) AS rbi_rank
        FROM
            salaries
        JOIN
            performances ON salaries.player_id = performances.player_id AND salaries.year = performances.year
        WHERE
            salaries.year = 2001
            AND performances.H > 0
            AND performances.RBI > 0
    ) AS ranks
JOIN
    players ON ranks.player_id = players.id
WHERE
    hit_rank <= 10 AND rbi_rank <= 10
ORDER BY
    players.id;
