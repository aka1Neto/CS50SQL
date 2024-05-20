CREATE VIEW "available" AS
    SELECT "listings"."id", "property_type", "host_name", "date"
    FROM "listings"
    JOIN "availabilities" AS a ON a."listing_id" = "listings"."id"
    WHERE "available" LIKE 'TRUE';
