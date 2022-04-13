# What's this then?

It's a "lab" exercise from a software development course in which to practice navigating SQL tables with inner joins and related functionality like limits and sorting.

# OK but... what _is_ it?

It's a single SQL file which is meant to be run against an otherwise empty database. The file sets up three tables to hold data pertaining to musicians and the bands that they perform with. One of the tables is for the musicians, one is for the bands, and the other is to associate musicians with bands.

To mess around with it, either just dig through `band_manager.sql` (and `task.md` if you want the full version of the instructions we were given at the start) or set up your own empty database on your local machine...
`createdb band_manager`
... and run the file against it, e.g. with PostgreSQL:
`psql -d band_manager -f band_manager.sql` (from the appropriate directory, of course)

I ended up putting most of my code in both `band_manager.sql` and `task.md` for reasons that mostly have to do with how a previous exercise instructed us to record our solutions, so you can get most of the pertinent info about how I chose to solve each task from either file. Since it would be kind of a shambles otherwise, the included `band_manager.sql` only has the `SELECT` statement from the first task, and the other 6 are commented out, but you can just uncomment them (probably one by one unless you want a whole bunch of lines in your terminal output) if you want to look at the output of each.

The original version of `band_manager.sql` we were provided with at the start of the exercise is in `startpoint`. I haven't bothered keeping the provided version of `task.md` because the only thing that's meaningfully different in later versions is that my solutions have been added underneath each task. If you desperately want to see the original `task.md`, I won't stop you looking at the initial commit, but I will judge you.
