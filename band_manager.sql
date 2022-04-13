DROP TABLE IF EXISTS bands_musicians;
DROP TABLE IF EXISTS bands;
DROP TABLE IF EXISTS musicians;


CREATE TABLE musicians (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255),
  instrument VARCHAR(255),
  net_worth INT
);

CREATE TABLE bands (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE bands_musicians (
  id SERIAL PRIMARY KEY,
  musician_id INT REFERENCES musicians(id) ON DELETE CASCADE,
  band_id INT REFERENCES bands(id) ON DELETE CASCADE
);


INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Eddie', 'Van Halen', 'Guitar', 1000000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Wolfgang', 'Van Halen', 'Bass', 50000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Alex', 'Van Halen', 'Drums', 50000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Dave Lee', 'Roth', 'Vocals', 2000000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('George', 'Harrison', 'Guitar', 5000000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Roy', 'Orbison', 'Vocals', 1000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Dave', 'Grohl', 'Guitar/Drums', 250000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Damon', 'Albarn', 'Vocals', 350000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Johnny', 'Marr', 'Guitar', 240000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Corey', 'Taylor', 'Vocals', 175000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Slash', null, 'Guitar', 1350000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('KK', 'Downing', 'Guitar', 3000000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Tiny', 'Weymouth', 'Guitar', 6000000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Chris', 'Frantz', 'Guitar', 1000);

INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Justine', 'Frischmann', 'Vocals', 20000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Justin', 'Welch', 'Drums', 1000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Donna', 'Matthews', 'Guitar', 5000);
INSERT INTO musicians (first_name, last_name, instrument, net_worth) VALUES ('Annie', 'Holland', 'Bass', 5000);

INSERT INTO bands (name) VALUES ('Van Halen');
INSERT INTO bands (name) VALUES ('Dave Lee Roth Band');
INSERT INTO bands (name) VALUES ('The Beatles');
INSERT INTO bands (name) VALUES ('The Traveling Wilburys');
INSERT INTO bands (name) VALUES ('Nirvana');
INSERT INTO bands (name) VALUES ('Foo Fighters');
INSERT INTO bands (name) VALUES ('Blur');
INSERT INTO bands (name) VALUES ('Gorillaz');
INSERT INTO bands (name) VALUES ('The Smiths');
INSERT INTO bands (name) VALUES ('Modest Mouse');
INSERT INTO bands (name) VALUES ('Slipknot');
INSERT INTO bands (name) VALUES ('Stone Sour');
INSERT INTO bands (name) VALUES ('Guns N'' Roses');
INSERT INTO bands (name) VALUES ('Road Crew');
INSERT INTO bands (name) VALUES ('Judas Priest');
INSERT INTO bands (name) VALUES ('King Diamond');
INSERT INTO bands (name) VALUES ('Talking Heads');
INSERT INTO bands (name) VALUES ('Tom Tom');
INSERT INTO bands (name) VALUES ('Elastica');

INSERT INTO bands_musicians (musician_id, band_id) VALUES (1,1);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (2,1);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (3,1);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (4,1);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (4,2);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (5,3);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (5,4);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (6,4);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (7,5);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (7,6);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (8,7);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (8,8);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (9,9);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (9,10);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (10,11);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (10,12);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (11,13);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (11,14);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (12,15);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (12,16);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (13,17);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (13,18);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (14,17);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (14,18);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (15,19);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (16,19);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (17,19);
INSERT INTO bands_musicians (musician_id, band_id) VALUES (18,19);

-- TASK 1. Select all the musicians' names and the bands they play in:
SELECT first_name, last_name, bands.name FROM musicians
INNER JOIN bands_musicians
ON bands_musicians.musician_id = musicians.id
INNER JOIN bands
ON bands_musicians.band_id = bands.id
ORDER BY bands.name;

-- TASK 2. Select all of the members of Elastica ordered by first name alphabetically.
-- Assuming you don't want to also include the band name in the results,
-- a second join is no longer required:
-- SELECT first_name, last_name FROM musicians
-- INNER JOIN bands_musicians
-- ON bands_musicians.musician_id = musicians.id
-- WHERE bands_musicians.band_id = 19
-- ORDER BY musicians.first_name;

-- TASK 3. Select all the members of Talking Heads and Tom Tom.
-- This depends if you want a list of all lines with both the musician and band names,
-- which will result in duplication of the musicians in the results, or just a list
-- of all musicians appearing in either band without specifying which one(s) they're in.
-- The following version does the latter, but I've put an alternative that does the
-- former inside task.md:
-- SELECT DISTINCT first_name, last_name FROM musicians
-- INNER JOIN bands_musicians
-- ON bands_musicians.musician_id = musicians.id
-- WHERE bands_musicians.band_id IN (17, 18)
-- ORDER BY musicians.last_name;

-- TASK 4. Select all of the bands that Slash is in,
-- ordered by band name in reverse alphabetical order:
-- SELECT name FROM bands
-- INNER JOIN bands_musicians
-- ON bands_musicians.band_id = band_id
-- WHERE bands_musicians.musician_id = 1
-- ORDER BY bands.name DESC;

-- TASK 5: Select all of the musicians who have a net worth greater than or equal to
-- 350000, ordered by net worth descending:
-- SELECT first_name, last_name, net_worth from musicians
-- WHERE net_worth >= 350000
-- ORDER BY net_worth DESC;

-- TASK 6: Select the musicians with the highest net worth.
-- Depends how many you want. You could do a top 5, top 10, or whatever.
-- This is a top 3:
-- SELECT first_name, last_name, net_worth from musicians
-- ORDER BY net_worth DESC LIMIT 3;

-- TASK 7: Select all of the musicians with a net worth between 350000 and 2000000,
-- ordered by net worth descending:
-- SELECT first_name, last_name, net_worth from musicians
-- WHERE net_worth BETWEEN 350000 AND 2000000
-- ORDER BY net_worth DESC;
