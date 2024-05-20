SELECT "salary" FROM "salaries" AS s
    JOIN "performances" AS p ON p."player_id" = s."player_id"
    WHERE s."year" = 2001 AND p."year" = 2001
    ORDER BY p."HR" DESC
    LIMIT 1;
