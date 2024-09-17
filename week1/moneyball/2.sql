SELECT "year", "salary" FROM "salaries"
    WHERE player_id = (
        SELECT "id" FROM "players"
            WHERE "first_name" LIKE 'Cal' AND "last_name" LIKE 'Ripken'
    )
    GROUP BY("year")
    ORDER BY "year" DESC;
