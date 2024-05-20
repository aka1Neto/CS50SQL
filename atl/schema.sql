CREATE TABLE "passengers"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL
);

CREATE TABLE "airlines"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "concourse" TEXT NOT NULL
);

CREATE TABLE "flights"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "flight_number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "from_air" TEXT NOT NULL CHECK(LENGTH("from_air") = 3),
    "to_air" TEXT NOT NULL CHECK(LENGTH("to_air") = 3),
    "departure_datetime" DATETIME NOT NULL,
    "arrival_datetime" DATETIME NOT NULL,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);

CREATE TABLE "check_ins"(
    "date" DATETIME NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "passenger_id" INTEGER NOT NULL,
    FOREIGN KEY("flight_id") REFERENCES "flights"("id"),
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id")
);
