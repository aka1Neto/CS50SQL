.import --csv meteorites.csv temporary

UPDATE "temporary" SET
    "mass" = CASE WHEN "mass" = '' THEN NULL ELSE ROUND("mass", 2) END,
    "year" = CASE WHEN "year" = '' THEN NULL ELSE "year" END,
    "lat" = CASE WHEN "lat" = '' THEN NULL ELSE ROUND("lat", 2) END,
    "long" = CASE WHEN "long" = '' THEN NULL ELSE ROUND("long", 2) END;

CREATE TABLE IF NOT EXISTS "meteorites"(
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "class" TEXT NOT NULL,
    "mass" REAL,
    "discovery" TEXT NOT NULL,
    "year" INTEGER,
    "lat" REAL,
    "long" REAL
);

INSERT INTO "meteorites"("name", "class", "mass", "discovery", "year", "lat", "long")
    SELECT "name", "class", "mass", "discovery", "year", "lat", "long" FROM "temporary"
        WHERE "nametype" != 'Relict'
        ORDER BY "year", "name";
