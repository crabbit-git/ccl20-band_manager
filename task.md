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
2. Select all of the members of Elastica ordered by first name alphabetically
3. Select all the members of Talking Heads and Tom Tom
4. Select all of the bands that Slash is in, ordered by band name in reverse alphabetical order
5. Select all of the musicians who have a net worth greater than or equal to 350000, ordered by net worth descending
6. Select the musicians with the highest net worth
7. Select all of the musicians with a net worth between 350000 and 2000000, ordered by net worth descending