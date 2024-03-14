
-- *** The Lost Letter ***
--To Check the origin adress id
--To check the id from packages that came from that id and get the destination code
--From the previous id we compare with the provided destination and check if it was dropped
SELECT * FROM "addresses"
WHERE "id" IN (
    SELECT "address_id" FROM "scans" WHERE "package_id" = (
        SELECT "id" FROM "packages" WHERE "from_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" = '900 Somerville Avenue'
        )
        AND "to_address_id" = (
            SELECT "id" FROM "addresses" WHERE "address" LIKE '2 ________ Street'
        )
    ) AND "action" = 'Drop'
);

-- *** The Devious Delivery ***
--started by checking packages with null sender
--with that address we check for scans
SELECT * FROM "addresses"
WHERE "id" = (
    SELECT "address_id" FROM "scans"
    WHERE "package_id" IN (
        SELECT "id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
    AND "address_id" != (
        SELECT "to_address_id" FROM "packages"
        WHERE "from_address_id" IS NULL
    )
);

-- *** The Forgotten Gift ***
--Check origin adress
--Check contents from package table using the addresses to get the id
SELECT contents FROM packages
WHERE from_address_id IN  (
    SELECT id FROM addresses WHERE address = '109 Tileston Street'
)
AND to_address_id = (
    SELECT id FROM addresses WHERE address = '728 Maple Place'
);

--From the id we check the status
--Check with scans to check to see if it was picked
--Check with whom it is
SELECT "name" FROM "drivers"
WHERE "id" IN (
    SELECT "driver_id" FROM "scans"
    WHERE "package_id" = (
        SELECT "id" FROM "packages"
        WHERE "to_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '728 Maple Place'
        )
        AND "from_address_id" = (
            SELECT "id" FROM "addresses"
            WHERE "address" = '109 Tileston Street'
        )
    )
    AND "address_id" != (
        SELECT "id" FROM "addresses"
        WHERE "address" = '109 Tileston Street'
    )
    AND "action" = "Pick"
);
