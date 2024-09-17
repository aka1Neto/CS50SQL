SELECT "name", "per_pupil_expenditure" AS "expense", "exemplary" FROM "districts" AS d
    JOIN "staff_evaluations" AS s ON s."district_id" = d."id"
    JOIN "expenditures" AS e ON e."district_id" = d."id"
    WHERE "type" LIKE "public school district" AND "expense" >= (
        SELECT AVG("per_pupil_expenditure") FROM "expenditures"
    ) AND "exemplary" >= (
        SELECT AVG("exemplary") FROM "staff_evaluations"
    )
    ORDER BY "expense" DESC, "exemplary" DESC;
