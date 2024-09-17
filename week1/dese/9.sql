SELECT "name" FROM "districts" AS d
    JOIN "expenditures" AS e ON e."district_id" = d."id"
    ORDER BY "pupils"
    LIMIT 1;
