SELECT "name", SUM("performances"."H") AS "Hits" FROM "teams"
JOIN "performances" ON performances.team_id = teams.id
WHERE "performances"."year" = 2001
GROUP BY "teams"."name" ORDER BY SUM("performances"."H") DESC
LIMIT 5;
