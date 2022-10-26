--- Inputting records ---

-- Film table inserts
INSERT INTO Film (FilmNo, FilmName)
VALUES
(25, 'Star Wars'),
(50, 'Jaws'),
(30, 'Star Trek'),
(40, 'ET');

-- Managger table inserts
INSERT INTO Manager (ManagerNo, ManagerName)
VALUES
(1, 'Jones'),
(2, 'Davies'),
(3, 'Thomas'),
(4, 'Smith');

-- Town table inserts
INSERT INTO Town(TownName, Population)
VALUES
('Cardiff', 300000),
('Swansea', 200000),
('Newport', 150000),
('Bridgend', 150000),
('Bristol', 350000);

-- Cinema table inserts
INSERT INTO Cinema(CinemaNo, CinemaName, TownName, ManagerNo)
VALUES
('BX', 'Rex', 'Cardiff', 1),
('KT', 'Rialto', 'Swansea', 3),
('DJ', 'Odeon', 'Newport', 1),
('TL', 'Classic', 'Bridgend', 2),
('RP', 'Grand', 'Bristol', 4),
('HF', 'State', 'Bristol', 4);

-- Takings table inserts
INSERT INTO Takings (FilmNo, CinemaNo, Takings)
VALUES
(25, 'BX', 900),
(25, 'KT', 350),
(25, 'DJ', 800),
(50, 'BX', 1200),
(50, 'DJ', 400),
(50, 'TL', 300),
(50, 'RP', 1500),
(50, 'HF', 1000),
(30, 'BX', 850),
(30, 'TL', 500),
(40, 'KT', 1200),
(40, 'RP', 2000);
