CREATE TABLE IF NOT EXISTS Film
(
    filmno integer NOT NULL,
    filmname character varying(255) NOT NULL,
    CONSTRAINT filmno PRIMARY KEY (filmno)
);


CREATE TABLE IF NOT EXISTS Manager
(
    managerno integer NOT NULL,
    managername character varying(255) NOT NULL,
    CONSTRAINT managerno PRIMARY KEY (managerno)
);


CREATE TABLE IF NOT EXISTS Towns
(
    townname character varying(255) NOT NULL,
    population integer NOT NULL,
    CONSTRAINT townname PRIMARY KEY (townname)
);


CREATE TABLE IF NOT EXISTS Cinema
(
    cinemano character varying(255) NOT NULL,
    cinemaname character varying(255) NOT NULL,
    townname character varying(255) NOT NULL,
    managerno integer NOT NULL,
    CONSTRAINT cinemano PRIMARY KEY (cinemano),
    CONSTRAINT managerno FOREIGN KEY (managerno)
        REFERENCES public.manager (managerno),
    CONSTRAINT townname FOREIGN KEY (townname)
        REFERENCES public.towns(townname)
);


CREATE TABLE IF NOT EXISTS Takings
(
    filmno integer NOT NULL,
    cinemano character varying(255) NOT NULL,
    takings numeric(9,2) NOT NULL,
    CONSTRAINT pkey PRIMARY KEY (filmno, cinemano),
    CONSTRAINT filmnofk FOREIGN KEY (filmno)
        REFERENCES public.film (filmno),
    CONSTRAINT cinemanofk FOREIGN KEY (cinemano)
        REFERENCES public.cinema(cinemano)
);



INSERT INTO public.film (filmno, filmname) VALUES (25, 'Star Wars');
INSERT INTO public.film (filmno, filmname) VALUES (50, 'Jaws');
INSERT INTO public.film (filmno, filmname) VALUES (30, 'Star Trek');
INSERT INTO public.film (filmno, filmname) VALUES (40, 'ET');

INSERT INTO public.manager (managerno, managername) VALUES (1, 'Jones');
INSERT INTO public.manager (managerno, managername) VALUES (2, 'Davies');
INSERT INTO public.manager (managerno, managername) VALUES (3, 'Thomas');
INSERT INTO public.manager (managerno, managername) VALUES (4, 'Smith');

INSERT INTO public.towns (townname, population) VALUES ('Cardiff', 300000);
INSERT INTO public.towns (townname, population) VALUES ('Swansea', 200000);
INSERT INTO public.towns (townname, population) VALUES ('Newport', 150000);
INSERT INTO public.towns (townname, population) VALUES ('Bridgend', 150000);
INSERT INTO public.towns (townname, population) VALUES ('Bristol', 350000);

INSERT INTO public.cinema (cinemano, cinemaname, townname, managerno) VALUES ('BX', 'Rex', 'Cardiff', 1);
INSERT INTO public.cinema (cinemano, cinemaname, townname, managerno) VALUES ('KT', 'Rialto', 'Swansea', 3);
INSERT INTO public.cinema (cinemano, cinemaname, townname, managerno) VALUES ('DJ', 'Odeon', 'Newport', 1);
INSERT INTO public.cinema (cinemano, cinemaname, townname, managerno) VALUES ('TL', 'Classic', 'Bridgend', 2);
INSERT INTO public.cinema (cinemano, cinemaname, townname, managerno) VALUES ('RP', 'Grand', 'Bristol', 4);
INSERT INTO public.cinema (cinemano, cinemaname, townname, managerno) VALUES ('HF', 'State', 'Bristol', 4);


INSERT INTO public.takings (filmno, cinemano, takings) VALUES (25, 'BX', 900);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (25, 'KT', 350);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (25, 'DJ', 800);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (50, 'BX', 1200);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (50, 'DJ', 400);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (50, 'TL', 300);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (50, 'RP', 1500);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (50, 'HF', 1000);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (30, 'BX', 850);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (30, 'TL', 500);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (40, 'KT', 1200);
INSERT INTO public.takings (filmno, cinemano, takings) VALUES (40, 'RP', 2000);

--select all cinemas
SELECT *
FROM Cinema;

-- select all cinemas managed by Smith
SELECT cinemano, cinemaname, townname, managername
FROM cinema
         INNER JOIN manager ON cinema.managerno = manager.managerno
WHERE manager.managername = 'Smith';

-- select all cinemas managed by Smith or Jones
SELECT cinemano, cinemaname, townname, managername
FROM cinema
         INNER JOIN manager
                    ON cinema.managerno = manager.managerno
WHERE managername IN ('Smith', 'Jones');

-- select all cinemas managed by Smith or Jones ordered by townname
SELECT cinemano, cinemaname, townname, managername
FROM cinema
         INNER JOIN manager
                    ON cinema.managerno = manager.managerno
WHERE managername IN ('Smith', 'Jones')
ORDER BY townname;




SELECT * FROM cinema;



CREATE VIEW myCinema AS
SELECT cinemano, cinemaname
FROM cinema;



SELECT * FROM myCinema;


CREATE VIEW myTakings AS
SELECT t.cinemano, t.filmNo, filmname, cinemaname
FROM takings t
INNER JOIN
film f ON t.filmno = f.filmno
INNER JOIN cinema c
ON t.cinemano = c.cinemano;

SELECT * FROM myTakings;

