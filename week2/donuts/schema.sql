CREATE TABLE "ingredients"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "ingredient" TEXT NOT NULL,
    "price" REAL NOT NULL
);

CREATE TABLE "donuts"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "donut" TEXT NOT NULL,
    "gluten-free" BOOLEAN NOT NULL,
    "price" REAL NOT NULL
);

CREATE TABLE "donut_ingredients"(
    "donut_id" INTEGER NOT NULL,
    "ingredient_id" INTEGER NOT NULL,
    PRIMARY KEY("donut_id", "ingredient_id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "costumers"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);

CREATE TABLE "orders"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "order_number" INTEGER NOT NULL,
    "costumer_id" INTEGER NOT NULL,
    FOREIGN KEY("costumer_id") REFERENCES "costumers"("id")
);

CREATE TABLE "details"(
    "order_id" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "quantity" INTEGER NOT NULL,
    PRIMARY KEY("order_id", "donut_id"),
    FOREIGN KEY("order_id") REFERENCES "orders"("id"),
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id")
);
