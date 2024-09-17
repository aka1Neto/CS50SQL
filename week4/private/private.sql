CREATE TABLE "cipher"(
    "id" INTEGER PRIMARY KEY,
    "char_number" INTEGER,
    "length" INTEGER
);

INSERT INTO "cipher"("id", "char_number", "length")
VALUES(14, 98, 4),
    (114, 3, 5),
    (618, 72, 9),
    (630, 7, 3),
    (932, 12, 5),
    (2230, 50, 7),
    (2346, 44, 10),
    (3041, 14, 5);

CREATE VIEW "message" AS
    SELECT substr("sentence", "char_number", "length") AS "phrase" FROM "cipher"
        LEFT JOIN "sentences" ON "sentences"."id" = "cipher"."id";
