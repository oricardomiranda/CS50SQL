CREATE TABLE "passengers" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL CHECK(age > 0)
);

CREATE TABLE "checkins" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    "timestamp" TIMESTAMP NOT NULL,
    FOREIGN KEY("passenger_id") REFERENCES "passengers"("id"),
    FOREIGN KEY("flight_id") REFERENCES "flights"("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "concourse" TEXT NOT NULL CHECK(concourse IN ('A','B','C','D','E','F','T'))
);

CREATE TABLE "flights" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "origin" TEXT NOT NULL,
    "destination" TEXT NOT NULL,
    "departure" DATETIME NOT NULL,
    "arrival" DATETIME NOT NULL,
    FOREIGN KEY("airline_id") REFERENCES "airlines"("id")
);
