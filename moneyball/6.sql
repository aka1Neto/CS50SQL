SELECT "name", sum("H") AS "total hits" FROM "teams" AS t
    JOIN "performances" AS p ON p."team_id" = t."id"
    WHERE p."year" = 2001
    GROUP BY(p."team_id")
    ORDER BY "total hits" DESC
    LIMIT 5;
