SELECT "year" AS "Year", "salary" AS "Salary" FROM "salaries"
WHERE "player_id" = (
	SELECT "id" FROM "players"
	WHERE "first_name" = 'Cal'
	AND "last_name" LIKE 'Ripken%'
)
GROUP BY "year"
ORDER BY "year" DESC 
