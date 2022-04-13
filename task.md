# SQL Lab

## Learning Objectives

- Be able to use inner joins to select the required dataset
- Be able to use Constraints, sorting and limiting

## Set up

Create a new database and run the SQL script: 

```bash
# terminal
createdb band_manager
psql -d band_manager -f band_manager.sql
```

## Tasks

1. Select all the musicians' names and the bands they play in

```
SELECT musicians.first_name, musicians.last_name, bands.name FROM musicians
INNER JOIN bands_musicians
ON bands_musicians.musician_id = musicians.id
INNER JOIN bands
ON bands_musicians.band_id = bands.id;
```


2. Select all of the members of Elastica ordered by first name alphabetically

```
SELECT musicians.first_name, musicians.last_name, bands.name FROM musicians
INNER JOIN bands_musicians
ON bands_musicians.musician_id = musicians.id
INNER JOIN bands
ON bands_musicians.band_id = bands.id
WHERE bands.id = 19
ORDER BY musicians.first_name;
```

Note however that this one doesn't actually say to include the band name, so you could do this instead (which only needs one inner join):
```
SELECT musicians.first_name, musicians.last_name FROM musicians
INNER JOIN bands_musicians
ON bands_musicians.musician_id = musicians.id
WHERE bands_musicians.band_id = 19
ORDER BY musicians.first_name;
```


3. Select all the members of Talking Heads and Tom Tom

This depends what is meant specifically. If the implication is to list all lines containing an association between both of those bands and the members, including mention of which band each person is in, you'd get a copy of each member that appears in both bands (and in this case both members appear in both bands, there are no musicians in only Talking Heads or only Tom Tom):
```
SELECT musicians.first_name, musicians.last_name, bands.name FROM musicians
INNER JOIN bands_musicians
ON bands_musicians.musician_id = musicians.id
INNER JOIN bands
ON bands_musicians.band_id = bands.id
WHERE bands.id IN (17, 18)
ORDER BY bands.name;
```
If the intent is instead to return the list of members who are in either of those bands, without bothering to mention in the results which of the two bands they're in, then you could do this, which also removes the duplicates:
```
SELECT DISTINCT musicians.first_name, musicians.last_name FROM musicians
INNER JOIN bands_musicians
ON bands_musicians.musician_id = musicians.id
WHERE bands_musicians.band_id IN (17, 18)
ORDER BY musicians.last_name;
```


4. Select all of the bands that Slash is in, ordered by band name in reverse alphabetical order

```
SELECT bands.name FROM bands
INNER JOIN bands_musicians
ON bands_musicians.band_id = band_id
WHERE bands_musicians.musician_id = 1
ORDER BY bands.name DESC;
```


5. Select all of the musicians who have a net worth greater than or equal to 350000, ordered by net worth descending

6. Select the musicians with the highest net worth

7. Select all of the musicians with a net worth between 350000 and 2000000, ordered by net worth descending
