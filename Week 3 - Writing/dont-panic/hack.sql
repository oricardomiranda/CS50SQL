UPDATE "users"
SET "password" = '982c0381c279d139fd221fce974916e7' --oops! hash
WHERE "username" = 'admin';

DELETE FROM "user_logs"
WHERE "new_password" = '982c0381c279d139fd221fce974916e7';

INSERT INTO "user_logs" ("type","old_username","old_password","new_password")
VALUES('update', 'admin', "982c0381c279d139fd221fce974916e7", (
	SELECT password FROM users
	WHERE username = 'emily33'
));
