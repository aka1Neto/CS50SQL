CREATE INDEX "search_course_semester"
    ON "courses"("semester");

CREATE INDEX "search_course_derpartament"
    ON "courses"("derpartament");

CREATE INDEX "search_course_title"
    ON "courses"("title");

CREATE INDEX "search_enrollment_student"
    ON "enrollments"("student_id");
