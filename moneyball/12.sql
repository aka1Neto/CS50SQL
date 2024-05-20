SELECT "first_name", "last_name" FROM "players"
    WHERE "id" IN (
        SELECT p."id" FROM "players" AS p
        JOIN "salaries" AS s ON s."player_id" = p."id"
        JOIN "performances" AS per ON per."player_id" = p."id" AND per."year" = s."year"
        WHERE per."year" = 2001 AND "H" != 0
        ORDER BY s."salary" / per."H", "first_name", "last_name"
        LIMIT 10
    ) AND "id" IN (
        SELECT p."id" FROM "players" AS p
        JOIN "salaries" AS s ON s."player_id" = p."id"
        JOIN "performances" AS per ON per."player_id" = p."id" AND per."year" = s."year"
        WHERE per."year" = 2001 AND "RBI" != 0
        ORDER BY s."salary" / per."RBI", "first_name", "last_name"
        LIMIT 10
    )
    ORDER BY "id";
