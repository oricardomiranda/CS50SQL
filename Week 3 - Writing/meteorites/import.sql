--Temporary table
CREATE TABLE meteorites_temp (
    name TEXT,
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nametype TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INTEGER,
    lat REAL,
    long REAL
);

--Import csv
.import --csv --skip 1 meteorites.csv meteorites_temp

--Null values where csv is empty
UPDATE meteorites_temp
SET mass = NULL
WHERE mass = '';

UPDATE meteorites_temp
SET year = NULL
WHERE year = '';

UPDATE meteorites_temp
SET lat = NULL
WHERE lat = '';

UPDATE meteorites_temp
SET long = NULL
WHERE long = '';

--Round to 2 decimal cases
UPDATE meteorites_temp
SET mass = ROUND(mass, 2),
    lat = ROUND(lat, 2),
    long = ROUND(long, 2);

--Delete Relict
DELETE FROM meteorites_temp
WHERE nametype = 'Relict';

--Create final db table
CREATE TABLE meteorites (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    class TEXT,
    mass REAL,
    discovery TEXT,
    year INTEGER,
    lat REAL,
    long REAL
);

--Insert into table
INSERT INTO meteorites (name, class, mass, discovery, year, lat, long)
SELECT name, class, mass, discovery, year, lat, long
FROM meteorites_temp
ORDER BY year ASC, name ASC;

--Drop temp table
DROP TABLE meteorites_temp;
