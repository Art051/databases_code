CREATE TABLE IF NOT EXISTS Film
(
    film_num integer NOT NULL,
    film_name character varying(255) NOT NULL,
    CONSTRAINT film_num PRIMARY KEY (film_num)
);


CREATE TABLE IF NOT EXISTS Manager
(
    manager_num integer NOT NULL,
    manager_name character varying(255) NOT NULL,
    CONSTRAINT manager_num PRIMARY KEY (manager_num)
);


CREATE TABLE IF NOT EXISTS Towns
(
    town_name character varying(255) NOT NULL,
    population integer NOT NULL,
    CONSTRAINT town_name PRIMARY KEY (town_name)
);


CREATE TABLE IF NOT EXISTS Cinema
(
    cinema_num character varying(255) NOT NULL,
    cinema_name character varying(255) NOT NULL,
    town_name character varying(255) NOT NULL,
    manager_num integer NOT NULL,
    CONSTRAINT cinema_num PRIMARY KEY (cinema_num),
    CONSTRAINT manager_num FOREIGN KEY (manager_num)
        REFERENCES public.manager (manager_num),
    CONSTRAINT town_name FOREIGN KEY (town_name)
        REFERENCES public.towns(town_name)
);


CREATE TABLE IF NOT EXISTS Takings
(
    film_num integer NOT NULL,
    cinema_num character varying(255) NOT NULL,
    takings numeric(9,2) NOT NULL,
    CONSTRAINT p_key PRIMARY KEY (film_num, cinema_num),
    CONSTRAINT film_num_fk FOREIGN KEY (film_num)
        REFERENCES public.film (film_num),
    CONSTRAINT cinema_num_fk FOREIGN KEY (cinema_num)
        REFERENCES public.cinema(cinema_num)
);



INSERT INTO public.film (film_num, film_name) VALUES (25, 'Star Wars');
INSERT INTO public.film (film_num, film_name) VALUES (50, 'Jaws');
INSERT INTO public.film (film_num, film_name) VALUES (30, 'Star Trek');
INSERT INTO public.film (film_num, film_name) VALUES (40, 'ET');

INSERT INTO public.manager (manager_num, manager_name) VALUES (1, 'Jones');
INSERT INTO public.manager (manager_num, manager_name) VALUES (2, 'Davies');
INSERT INTO public.manager (manager_num, manager_name) VALUES (3, 'Thomas');
INSERT INTO public.manager (manager_num, manager_name) VALUES (4, 'Smith');

INSERT INTO public.towns (town_name, population) VALUES ('Cardiff', 300000);
INSERT INTO public.towns (town_name, population) VALUES ('Swansea', 200000);
INSERT INTO public.towns (town_name, population) VALUES ('Newport', 150000);
INSERT INTO public.towns (town_name, population) VALUES ('Bridgend', 150000);
INSERT INTO public.towns (town_name, population) VALUES ('Bristol', 350000);

INSERT INTO public.cinema (cinema_num, cinema_name, town_name, manager_num) VALUES ('BX', 'Rex', 'Cardiff', 1);
INSERT INTO public.cinema (cinema_num, cinema_name, town_name, manager_num) VALUES ('KT', 'Rialto', 'Swansea', 3);
INSERT INTO public.cinema (cinema_num, cinema_name, town_name, manager_num) VALUES ('DJ', 'Odeon', 'Newport', 1);
INSERT INTO public.cinema (cinema_num, cinema_name, town_name, manager_num) VALUES ('TL', 'Classic', 'Bridgend', 2);
INSERT INTO public.cinema (cinema_num, cinema_name, town_name, manager_num) VALUES ('RP', 'Grand', 'Bristol', 4);
INSERT INTO public.cinema (cinema_num, cinema_name, town_name, manager_num) VALUES ('HF', 'State', 'Bristol', 4);


INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (25, 'BX', 900);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (25, 'KT', 350);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (25, 'DJ', 800);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (50, 'BX', 1200);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (50, 'DJ', 400);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (50, 'TL', 300);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (50, 'RP', 1500);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (50, 'HF', 1000);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (30, 'BX', 850);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (30, 'TL', 500);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (40, 'KT', 1200);
INSERT INTO public.takings (film_num, cinema_num, takings) VALUES (40, 'RP', 2000);

--select all cinemas
SELECT *
FROM Cinema;

-- select all cinemas managed by Smith
SELECT cinema_num, cinema_name, town_name, manager_name
FROM cinema
         INNER JOIN manager ON cinema.manager_num = manager.manager_num
WHERE manager.manager_name = 'Smith';

-- select all cinemas managed by Smith or Jones
SELECT cinema_num, cinema_name, town_name, manager_name
FROM cinema
         INNER JOIN manager
                    ON cinema.manager_num = manager.manager_num
WHERE manager_name IN ('Smith', 'Jones');

-- select all cinemas managed by Smith or Jones ordered by town_name
SELECT cinema_num, cinema_name, town_name, manager_name
FROM cinema
         INNER JOIN manager
                    ON cinema.manager_num = manager.manager_num
WHERE manager_name IN ('Smith', 'Jones')
ORDER BY town_name;
