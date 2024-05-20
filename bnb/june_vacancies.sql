CREATE VIEW "june_vacancies" AS
    SELECT "listings"."id", "property_type", "host_name", count("days") AS "days_vacants"
    FROM "listings"
    JOIN "availabilities" AS a ON a."listing_id" = "listings"."id"
    WHERE "available" LIKE 'TRUE' AND "date" LIKE '2023-06%'
    GROUP BY "listings"."id";
