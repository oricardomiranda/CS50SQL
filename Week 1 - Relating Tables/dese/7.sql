SELECT "name" FROM "schools"
WHERE "id" IN (
	SELECT "id" FROM "schools"
	WHERE "district_id" = (
		SELECT "id" FROM "districts"
		WHERE name = 'Cambridge'
	)
);
