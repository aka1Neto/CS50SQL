SELECT "name", "per_pupil_expenditure" AS "expense" FROM "districts" AS d
    JOIN "expenditures" AS e ON e."district_id" = d."id"
    WHERE d."type" LIKE 'public school district'
    ORDER BY "expense" DESC
    LIMIT 10;
