SELECT
    "districts"."name",
    "graduation_rates"."dropped"
FROM
    "districts"
JOIN
    "schools" ON "districts"."id" = "schools"."district_id"
JOIN
    "graduation_rates" ON "schools"."id" = "graduation_rates"."school_id"
WHERE
    "graduation_rates"."graduated" > (
        SELECT AVG("graduated")
        FROM "graduation_rates"
    )
ORDER BY
    "graduation_rates"."dropped" DESC
LIMIT 10;
