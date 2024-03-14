SELECT "first_name","last_name"
FROM "players"
WHERE "final_game" LIKE "2022-__-__"
AND "birth_year" > 2000
ORDER BY "first_name", "last_name";
