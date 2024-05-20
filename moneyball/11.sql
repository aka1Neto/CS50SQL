SELECT "first_name", "last_name", "salary" / "H" AS "dollars per hit" FROM "players" AS p
    JOIN "salaries" AS s ON s."player_id" = p."id"
    JOIN "performances" AS per ON per."player_id" = p."id" AND per."year" = s."year"
    WHERE per."year" = 2001 AND "H" != 0
    ORDER BY "dollars per hit", "first_name", "last_name"
    LIMIT 10;
