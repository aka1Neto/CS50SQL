SELECT "city", count("city") AS "number" FROM "schools"
    WHERE "type" LIKE "public school"
    GROUP BY("city")
    ORDER BY "number" DESC, "city"
    LIMIT 10;
