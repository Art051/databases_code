-- Introduction to PLPGSQL Parameter Modes

create or replace function find_film_by_id(p_film_id integer)
returns varchar
language plpgsql
as $$
declare
   film_name film.filmname%type;
begin
  -- find film title by id
  select filmname
  into film_name
  from film
  where filmno = p_film_id;

  if not found then
     raise 'Film with id % not found', p_film_id;
  end if;

  return film_name;

end;$$

SELECT find_film_by_id(25);

--------------------------------------------------

create or replace function get_film_stat(
    out min_receipts integer,
    out max_receipts integer,
    out avg_receipts integer)
language plpgsql
as $$
begin

  select min(takings),
         max(takings),
		 avg(takings)
  into min_receipts, max_receipts, avg_receipts
  from takings;

end;$$

select get_film_stat();

select * from get_film_stat();

-- Example of InOut Parameters
create or replace function swap(
	inout x int,
	inout y int
)
language plpgsql
as $$
begin
   select x,y into y,x;
end; $$;

select * from swap(10,20);

-- Find a Cinema by its CinemaNo and Return the Cinema Name
create or replace function find_cinema_by_id(p_cinema_id text)
returns varchar
language plpgsql
as $$
declare
   cinema_name cinema.cinemaname%type;
begin
  -- find Cinema title by id
  select cinemaname
  into cinema_name
  from cinema
  where Cinemano = p_cinema_id;

  if not found then
     raise 'Cinmea with id % not found', p_cinema_id;
  end if;

  return cinema_name;

end;$$

SELECT find_cinema_by_id('HF');

-- Find a Cinema by its CinemaNo and return its CinemaName, Town and ManagerNo;
create or replace function get_cinema_info(
    inout inout_cinemano text,
    out out_cinemaname text,
    out out_managerno integer)
language plpgsql
as $$
begin

  select cinemano, cinemaname, managerno
  into inout_cinemano, out_cinemaname, out_managerno
  from cinema;

end;$$

Select * From get_cinema_info('HF');

-- Find a Cinema by its CinemaNo and return its CinemaName, Town and ManagerName;
create or replace function get_cinema_manager_info(
    inout inout_cinemano text,
    out out_cinemaname text,
    out out_managername text)
language plpgsql
as $$
begin

  select cinemano, cinemaname, managername
  into inout_cinemano, out_cinemaname, out_managername
  from cinema Inner join Manager
  On cinema.managerno = manager.managerno;

end;$$

Select * From get_cinema_manager_info('BX');

-- Find the minimum, maximum and average populations for Towns where there are cinemas;
create or replace function get_town_stats(
    out min_population integer,
    out max_population integer,
    out avg_population integer)
language plpgsql
as $$
begin

  select min(population),
         max(population),
		 avg(population)
  into min_population, max_population, avg_population
  from Town;

end;$$

Select * From get_town_stats();

-- Find a Town by its name and return the Town name and population.
create or replace function find_town_population(
	in in_town_name text,
	out out_town_name text,
	out out_population integer)
language plpgsql
as $$

begin
  -- find Town and Population by TownName
  select town, population
  into out_town_name, out_population
  from Town
  where townname = in_town_name;

  if not found then
     raise 'TownName with name % not found', in_town_name;
  end if;

end;$$

Select * From find_town_population('Cardiff');