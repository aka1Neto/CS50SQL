
-- *** The Lost Letter ***
SELECT "id" FROM "addresses"
    WHERE "address" LIKE '900 Somerville Avenue';

SELECT * FROM "packages"
    WHERE "from_address_id" = 432;

SELECT "address", "type" FROM "addresses"
    WHERE "id" = (
        SELECT "to_address_id" FROM "packages"
            WHERE "contents" LIKE "Congratulatory letter" AND "from_address_id" = (
                SELECT "id" FROM "addresses"
                    WHERE "address" LIKE '900 Somerville Avenue'
            )
    );

-- *** The Devious Delivery ***
SELECT "contents" FROM "packages"
    WHERE "from_address_id" IS NULL;

SELECT "address", "type" FROM "addresses"
    WHERE "id" = (
        SELECT "address_id" FROM "scans"
            WHERE "action" LIKE "drop" AND "package_id" = (
                SELECT "id" FROM "packages"
                    WHERE "from_address_id" IS NULL
            )
    );

-- *** The Forgotten Gift ***
SELECT * FROM "packages"
    WHERE "from_address_id" = (
        SELECT "id" FROM "addresses"
            WHERE "address" LIKE '109 Tileston Street'
    );

SELECT "name" from "drivers"
    WHERE "id" = (
        SELECT "driver_id" FROM "scans"
            WHERE "action" LIKE 'pick' AND "address_id" = (
                SELECT "address_id" FROM "scans"
                    WHERE "action" LIKE 'drop' AND "package_id" = (
                        SELECT "id" FROM "packages"
                            WHERE "from_address_id" = (
                                SELECT "id" FROM "addresses"
                                    WHERE "address" LIKE '109 Tileston Street'
                    )
            )
        ) AND "package_id" = (
            SELECT "id" FROM "packages"
                WHERE "from_address_id" = (
                     SELECT "id" FROM "addresses"
                        WHERE "address" LIKE '109 Tileston Street'
                )
        )
    );
    