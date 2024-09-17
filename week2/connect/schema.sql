CREATE TABLE "users"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "fisrt_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "user_name" TEXT UNIQUE NOT NULL,
    "password" TEXT NOT NULL
);

CREATE TABLE "schools_universities"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT UNIQUE NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year_founded" INTEGER CHECK(LENGTH("year_founded" = 3))
);

CREATE TABLE "companies"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "name" TEXT UNIQUE NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

CREATE TABLE "users_connection"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "follower_id" INTEGER NOT NULL,
    "followed_id" INTEGER NOT NULL,
    FOREIGN KEY("follower_id") REFERENCES "users"("id"),
    FOREIGN KEY("followed_id") REFERENCES "users"("id"),
    CONSTRAINT user_connection UNIQUE ("follower_id", "followed_id")
);

CREATE TABLE "schools_connection"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "student_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "degree" TEXT NOT NULL,
    FOREIGN KEY("student_id") REFERENCES "users"("id"),
    FOREIGN KEY("school_id") REFERENCES "schools_universites"("id"),
    CONSTRAINT school_connection UNIQUE ("student_id", "school_id")
);

CREATE TABLE "companies_connection"(
    "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    "start_date" DATE NOT NULL,
    "end_date" DATE,
    "title" TEXT NOT NULL,
    FOREIGN KEY("user_id") REFERENCES "users"("id"),
    FOREIGN KEY("company_id") REFERENCES "companies"("id"),
    CONSTRAINT company_connection UNIQUE ("user_id", "company_id")
);
