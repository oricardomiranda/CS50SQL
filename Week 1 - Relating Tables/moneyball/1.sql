SELECT "year" AS "Year", ROUND(AVG("salary"),2) AS "Average Salary" FROM "salaries"
GROUP BY "year"
ORDER BY "year" DESC
