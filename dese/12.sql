SELECT "name", "per_pupil_expenditure" AS "expense", "exemplary" FROM "districts" AS d
    JOIN "staff_evaluations" AS s ON s."district_id" = d."id"
    JOIN "expenditures" AS e ON e."district_id" = d."id"
    WHERE "type" LIKE "public school district" AND "expense" >= (
        SELECT AVG("per_pupil_expenditure") FROM "expenditures" AS e
    ) AND "exemplary" >= (
        SELECT AVG("exemplary") FROM "staff_evaluations" AS s
    )
    ORDER BY "exemplary" DESC,"expense" DESC;
