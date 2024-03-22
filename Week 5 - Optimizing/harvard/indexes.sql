CREATE INDEX "student_historical" ON "students" ("student_id", "course_id");
CREATE INDEX "student_cs" ON "students" ("id","name");
CREATE INDEX "courses_name" ON "students" ("department","semester","title");
CREATE INDEX "cs_index" ON "students" ("id");
CREATE INDEX "adv_db_2023" ON "courses" ("id","department","semester","title")
WHERE "semester" = 2023;
CREATE INDEX "course_req" ON "courses" ("deparment","number","semester","title");
