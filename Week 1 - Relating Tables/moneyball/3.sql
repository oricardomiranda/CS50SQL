SELECT "year" AS "Year", "HR" AS "Homeruns" FROM "performances"
WHERE "player_id" = (
	SELECT "id" FROM "players"
	WHERE "first_name" = 'Ken'
	AND "last_name" LIKE 'Griffey'
	AND "birth_year" = 1969
	)
GROUP BY "year"
ORDER BY "year" DESC
