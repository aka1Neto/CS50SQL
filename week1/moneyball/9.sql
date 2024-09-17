SELECT "name", round(AVG("salary"), 2) AS "avarage salary" FROM "teams" AS t
    JOIN "salaries" AS s ON s."team_id" =  t."id"
    WHERE s."year" = 2001
    GROUP BY(s."team_id")
    ORDER BY "avarage salary"
    LIMIT 5;
