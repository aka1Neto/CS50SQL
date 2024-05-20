SELECT "first_name", "last_name", "salary", "HR", s."year" FROM "players" AS p
    JOIN "salaries" AS s ON s."player_id" = p."id"
    JOIN "performances" AS per ON per."player_id" = p."id" AND per."year" = s."year"
    ORDER BY p."id", s."year" DESC, per."HR" DESC, s."salary" DESC;
