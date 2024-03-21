CREATE TABLE "ingredients" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL UNIQUE,
    "quantity" NUMERIC NOT NULL,
    "price_per_unit" NUMERIC NOT NULL
);

CREATE TABLE "donuts" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL UNIQUE,
    "gluten_free" BOOLEAN,
    "price" NUMERIC NOT NULL,
    "listed" BOOLEAN,
    "ingredient_id" INTEGER,
    FOREIGN KEY("ingredient_id") REFERENCES "ingredients"("id")
);

CREATE TABLE "orders" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "order_number" INTEGER NOT NULL UNIQUE,
    "quantity" INTEGER NOT NULL CHECK(quantity > 0),
    "donut_id" INTEGER NOT NULL,
    "customer_id" INTEGER NOT NULL,
    FOREIGN KEY("donut_id") REFERENCES "donuts"("id"),
    FOREIGN KEY("customer_id") REFERENCES "customers"("id")
);

CREATE TABLE "customers" (
    "id" INTEGER PRIMARY KEY AUTOINCREMENT,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL
);
