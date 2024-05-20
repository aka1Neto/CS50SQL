CREATE VIEW "most_populated" AS
    SELECT "district", sum("families"), sum("households"), sum("population"), sum("male"), sum("female")
    FROM "census"
    GROUP BY "district"
    ORDER BY sum("population") DESC;
