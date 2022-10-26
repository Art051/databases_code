-- Lecture 7 - Function Parameters - Aims at lecture 3 cinemas tables

-- NOTE: IMPROVE FUNCTION NAMING, THESE ARE FAR TOO LONG, LOOK AT MODEL ANS. FOR BETTER NAMING OF FUNCTIONS!

-- IN Mode Example
-- The following function finds a film by its id and returns the title of the film:
CREATE OR REPLACE FUNCTION find_film_by_id(p_film_id integer)
    RETURNS varchar
    LANGUAGE plpgsql
AS
$$
DECLARE
    film_name film.filmname%type;
BEGIN
    -- find film title by id
    SELECT filmname
    INTO film_name
    FROM film
    WHERE filmno = p_film_id;

    IF NOT found THEN
        RAISE 'Film with id % not found', p_film_id;
    END IF;

    RETURN film_name;

END;
$$;

-- Usage of above function:
SELECT find_film_by_id(25);

-- OUT Mode Example
CREATE OR REPLACE FUNCTION get_film_stat(
    OUT min_receipts integer,
    OUT max_receipts integer,
    OUT avg_receipts integer
)
    LANGUAGE plpgsql
AS
$$
BEGIN
    SELECT MIN(takings),
           MAX(takings),
           AVG(takings)
    INTO min_receipts, max_receipts, avg_receipts
    FROM takings;
END;
$$;

SELECT get_film_stat();
SELECT *
FROM get_film_stat();


-- INOUT Mode Example
CREATE OR REPLACE FUNCTION swap(
    INOUT x int,
    INOUT y int
)
    LANGUAGE plpgsql
AS
$$
BEGIN
    SELECT x, y INTO y,x;
END;
$$;

SELECT *
FROM swap(10, 20);

/*
 PL/pgSQL support three parameter modes: in, out, and intout.
By default, a parameter takes the in mode.
Use the in mode if you want to pass a value to the function.
Use the out mode if you want to return a value from a function.
Use the inout mode when you want to pass in an initial value, update the value in the function, and return it updated value back.
 */


-- Exercises


-- Find a Cinema by its CinemaNo and return the CinemeName;
CREATE OR REPLACE FUNCTION find_cinemaname_by_cinemano(p_cinemano varchar)
    RETURNS varchar
    LANGUAGE plpgsql
AS
$$
DECLARE
    cinema_name cinema.cinemaname%type;
BEGIN
    SELECT cinemaname
    INTO cinema_name
    FROM cinema
    WHERE cinemano = p_cinemano;

    IF NOT found THEN
        RAISE 'Cinema with cinema number % not found', p_cinemano;
    END IF;

    RETURN cinema_name;

END;
$$;

SELECT *
FROM find_cinemaname_by_cinemano('BX');


DROP FUNCTION find_cName_cTown_cMgrNo_by_cinemano(p_cinemano varchar);


-- Find a Cinema by its CinemaNo and return its CinemaName, Town and ManagerNo;
CREATE OR REPLACE FUNCTION find_cName_cTown_cMgrNo_by_cinemano(p_cinemano varchar)
    RETURNS TABLE
            (
                cinema_name   cinema.cinemaname%type,
                cinema_town   cinema.townname%type,
                cinema_mgr_no cinema.managerno%type
            )
AS
$$
BEGIN
    RETURN QUERY SELECT cinemano,
                        townname,
                        managerno
                 FROM cinema
                 WHERE cinemano = p_cinemano;
END;
$$
    LANGUAGE 'plpgsql';

SELECT *
FROM find_cName_cTown_cMgrNo_by_cinemano('BX');


--  Find a Cinema by its CinemaNo and return its CinemaName, Town and ManagerName;
CREATE OR REPLACE FUNCTION find_cName_cTown_cMgrName_by_cinemano(p_cinemano varchar)
    RETURNS TABLE
            (
                cinema_name     cinema.cinemaname%type,
                cinema_town     cinema.townname%type,
                cinema_mgr_name manager.managername%type
            )
AS
$$
BEGIN
    RETURN QUERY SELECT cinemano,
                        townname,
                        managername
                 FROM cinema c
                          JOIN manager m ON c.managerno = m.managerno
                 WHERE c.cinemano = p_cinemano;
END;
$$
    LANGUAGE 'plpgsql';

SELECT *
FROM find_cName_cTown_cMgrName_by_cinemano('BX');


-- Find the minimum, maximum and average populations for Towns where there are cinemas;
CREATE OR REPLACE FUNCTION get_town_pop_stats(
    OUT min_pop integer,
    OUT max_pop integer,
    OUT avg_pop integer
)
    LANGUAGE plpgsql
AS
$$
BEGIN
    SELECT MIN(population),
           MAX(population),
           AVG(population)
    INTO min_pop, max_pop, avg_pop
    FROM town;
END;
$$;

SELECT get_town_pop_stats();
SELECT *
FROM get_town_pop_stats();



DROP FUNCTION find_townname_townpop_from_townname;
-- Find a Town by its name and return the Town name and population.
CREATE OR REPLACE FUNCTION find_townname_townpop_from_townname(
    IN p_town_name varchar,
    OUT town_name varchar,
    OUT town_pop integer
)
    LANGUAGE plpgsql
AS
$$
BEGIN
    SELECT townname, population
    INTO town_name, town_pop
    FROM town
    WHERE p_town_name = townname;

    -- the next 3 lines (if not found section) was missing from my solution
  if not found then
     raise 'TownName with name % not found', town_name;
  end if;

END;
$$;


SELECT find_townname_townpop_from_townname('Cardiff');
SELECT *
FROM find_townname_townpop_from_townname('Cardiff');