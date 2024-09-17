SELECT "city", count("city") AS "number" FROM "schools"
    WHERE "type" LIKE "public school"
    GROUP BY("city")
    HAVING "number" <= 3
    ORDER BY "number" DESC, "city";
