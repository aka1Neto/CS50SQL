SELECT "year", round(AVG("salary"), 2) FROM "salaries"
    GROUP BY("year")
    ORDER BY "year" DESC;
