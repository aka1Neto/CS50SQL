SELECT "first_name", "last_name", "salary" FROM "players" AS p
    JOIN "salaries" AS s ON s."player_id" = p."id"
    WHERE "year" = 2001
    ORDER BY "salary", "first_name", "last_name", p."id"
    LIMIT 50;
