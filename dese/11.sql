SELECT "name", "per_pupil_expenditure" AS "expense", "graduated" FROM "schools" AS s
    JOIN "expenditures" AS e ON e."district_id" = s."district_id"
    JOIN "graduation_rates" AS g ON g."school_id" = s."id"
    ORDER BY "expense" DESC, "name";
