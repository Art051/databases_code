--Model answers for creating tables from the last lecture's exercise

-- create film table
CREATE TABLE Film(
  FilmNo integer,
  FilmName text,
  CONSTRAINT FilmNo_pk PRIMARY KEY (FilmNo)
);

-- create town table
CREATE TABLE Town(
  TownName text,
  Population integer,
  CONSTRAINT TownName_pk PRIMARY KEY (TownName)
);

-- create manager table
CREATE TABLE Manager(
  ManagerNo integer,
  ManagerName text,
  CONSTRAINT ManagerNo_pk PRIMARY KEY (ManagerNo)
);

-- create cinema table
CREATE TABLE Cinema(
  CinemaNo text,
  CinemaName text,
  TownName text,
  ManagerNo integer,
  CONSTRAINT CinemaNo_pk PRIMARY KEY (CinemaNo),
  CONSTRAINT TownName_fk FOREIGN KEY (TownName)
  REFERENCES Town(TownName),
  CONSTRAINT ManagerNo_fk FOREIGN KEY (ManagerNo)
  REFERENCES Manager(ManagerNo)
);

-- create  takings table
CREATE TABLE Takings(
  FilmNo integer,
  CinemaNo text,
  Takings integer,
  CONSTRAINT FilmNo_CinemaNO_pk PRIMARY KEY (FilmNo, CinemaNo),
  CONSTRAINT FilmNo_fk FOREIGN KEY (FilmNo)
  REFERENCES Film(FilmNo),
  CONSTRAINT CinemaNo_fk FOREIGN KEY (CinemaNo)
  REFERENCES Cinema(CinemaNo)
);
